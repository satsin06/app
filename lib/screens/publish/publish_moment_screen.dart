import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socfony/widgets/card_wrapper.dart';

import '../../widgets/dynamic_app_bar.dart';
import 'providers/text_editing_controller_provider.dart';

class PublishMomentScreen extends StatelessWidget {
  const PublishMomentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(
        title: (_, __) => const Text('发布动态'),
        actions: (_, __) => [
          const _PublishButton(),
        ],
        // leading: dynamicCloseButtonBuilder,
      ),
      body: ListView(
        children: [
          CardWrapper(
            child: Column(
              children: const [
                _TitleFieldInput(),
                Divider(),
                _ContentFieldInput(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PublishButton extends ConsumerWidget {
  const _PublishButton({
    Key? key,
  }) : super(key: key);

  void _onPushlishHandler(BuildContext context) async {
    // final PublishController controller = PublishController.of(context);
    // final result = await createMoment(controller);

    // print(result);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isValid =
        ref.watch(contentTextEditingControllerProvider).text.trim().isNotEmpty;

    VoidCallback? onPressed;
    if (isValid) {
      onPressed = () => _onPushlishHandler(context);
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
        controller: ref.watch(contentTextEditingControllerProvider),
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
        controller: ref.watch(titleTextEditingControllerProvider),
        decoration: const InputDecoration(
          hintText: '标题（可选）',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
