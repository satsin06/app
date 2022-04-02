import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socfony/widgets/card_wrapper.dart';

import '../../widgets/dynamic_app_bar.dart';
import 'publish_controller.dart';

class PublishMomentScreen extends StatelessWidget {
  const PublishMomentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PublishController(),
      child: const _Scaffold(),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(
        title: (_, __) => const Text('发布动态'),
        actions: (_, __) => [
          const _PublishButton(),
        ],
      ),
      body: const _Body(),
    );
  }
}

class _PublishButton extends StatelessWidget {
  const _PublishButton({
    Key? key,
  }) : super(key: key);

  void _onPushlishHandler(BuildContext context) {
    print(11);
  }

  @override
  Widget build(BuildContext context) {
    final PublishController controller = PublishController.of(context);
    VoidCallback? onPressed;
    if (controller.content.isNotEmpty) {
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

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}

class _ContentFieldInput extends StatelessWidget {
  const _ContentFieldInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        context.read<PublishController>().contentTextEditingController;
    return Padding(
      padding: const EdgeInsets.all(16.0).copyWith(top: 0),
      child: TextField(
        controller: controller,
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

class _TitleFieldInput extends StatelessWidget {
  const _TitleFieldInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        context.read<PublishController>().titleTextEditingController;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: '标题（可选）',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
