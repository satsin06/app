import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socfony/widgets/card_wrapper.dart';

import '../../widgets/dynamic_app_bar.dart';

final $TitleTextEditingControllerProvider =
    ChangeNotifierProvider.autoDispose<TextEditingController>(
        (_) => TextEditingController());

final $ContentTextEditingControllerProvider =
    ChangeNotifierProvider.autoDispose<TextEditingController>(
        (_) => TextEditingController());

final $ImagesProvider = StateProvider.autoDispose<List<File>>((ref) => []);

final $SendingProvider = StateProvider.autoDispose<bool>((ref) => false);

class PublishMomentScreen extends ConsumerWidget {
  const PublishMomentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async => !ref.read($SendingProvider),
      child: Scaffold(
        appBar: DynamicAppBar(
          title: (_, __) => const Text('发布动态'),
          actions: (_, __) => [
            const _PublishButton(),
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(height: 24),
            CardWrapper(
              child: Column(
                children: const [
                  _TitleFieldInput(),
                  Divider(height: 0, indent: 16),
                  _ContentFieldInput(),
                ],
              ),
            ),
            const CardExternalTitle('媒体内容'),
            const _MediaCard(),
          ],
        ),
      ),
    );
  }
}

class _MediaCard extends ConsumerWidget {
  const _MediaCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImagesCount = ref.watch(
      $ImagesProvider.select((value) => value.length),
    );

    if (pickedImagesCount > 0) return const _PickedImagesCard();

    return CardWrapper(
      child: ListTile(
        leading: const Icon(Icons.photo_library),
        title: const Text('选择图片'),
        onTap: () async {
          /// If sending is in progress, do nothing.
          if (ref.read($SendingProvider)) return;

          /// Get the image from the gallery.
          final picked = await ImagePicker().pickMultiImage(
            imageQuality: 100,
            maxHeight: 9999,
            maxWidth: 9999,
          );

          /// If the user cancels the image picker, do nothing.
          if (picked == null) return;

          /// Add the picked images to the list.
          ref
              .read($ImagesProvider.notifier)
              .update((state) => picked.map((e) => File(e.path)).toList());
        },
      ),
    );
  }
}

class _PublishButton extends ConsumerWidget {
  const _PublishButton({Key? key}) : super(key: key);

  void _onPushlishHandler(BuildContext context, WidgetRef ref) async {
    if (ref.read($SendingProvider)) return;
    // final PublishController controller = PublishController.of(context);
    // final result = await createMoment(controller);

    // print(result);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSending = ref.watch($SendingProvider);

    if (isSending) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(right: 16),
          child: SizedBox.square(
            child: CircularProgressIndicator(strokeWidth: 3),
            dimension: 20,
          ),
        ),
      );
    }

    final bool contentIsNotEmpty =
        ref.watch($ContentTextEditingControllerProvider).text.trim().isNotEmpty;
    final bool imageIsSelected =
        ref.watch($ImagesProvider.select((value) => value.isNotEmpty));
    VoidCallback? onPressed;
    if ((contentIsNotEmpty || imageIsSelected) && !isSending) {
      onPressed = () => _onPushlishHandler(context, ref);
    }

    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
          onPressed: onPressed,
          child: const Text('发布'),
        ),
      ),
    );
  }
}

class _ContentFieldInput extends ConsumerWidget {
  const _ContentFieldInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(top: 0),
      child: TextField(
        enabled: !ref.watch($SendingProvider),
        controller: ref.watch($ContentTextEditingControllerProvider),
        decoration: const InputDecoration(
          hintText: '请输入动态内容...',
          border: InputBorder.none,
        ),
        minLines: 3,
        maxLines: 6,
        maxLength: 600,
      ),
    );
  }
}

class _TitleFieldInput extends ConsumerWidget {
  const _TitleFieldInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        enabled: !ref.watch($SendingProvider),
        controller: ref.watch($TitleTextEditingControllerProvider),
        decoration: const InputDecoration(
          hintText: '标题（可选）',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _PickedImagesCard extends ConsumerWidget {
  const _PickedImagesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Iterable<Widget> children = ref
        .watch($ImagesProvider)
        .map<Widget>((image) => _childBuilder(context, ref, image));

    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      crossAxisCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 1.0,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: children.toList(),
    );
  }

  Widget _childBuilder(BuildContext context, WidgetRef ref, File image) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: ClipRRect(
            child: Image.file(image, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: DecoratedBox(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 16,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                ),
              ),
            ),
            onTap: () {
              ref
                  .read($ImagesProvider.notifier)
                  .update((state) => state.where((e) => e != image).toList());
            },
          ),
        ),
      ],
    );
  }
}
