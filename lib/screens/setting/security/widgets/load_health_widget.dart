import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socfony/widgets/card_wrapper.dart';

import '../providers.dart';

abstract class LoadHealthWidget extends ConsumerWidget {
  const LoadHealthWidget({Key? key}) : super(key: key);

  Widget builder(BuildContext context, WidgetRef ref);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loadHealthResults).when(
          data: (_) => builder(context, ref),
          error: (_, __) => const CardWrapper(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text('加载失败'),
            ),
          ),
          loading: () => const CardWrapper(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: SizedBox.square(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
                dimension: 24,
              ),
            ),
          ),
        );
  }
}
