import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme.dart';
import '../../theme/theme.dart' hide Theme;
import '../../widgets/card_wrapper.dart';
import '../../widgets/dynamic_app_bar.dart';

class ThemeSettingScreen extends StatelessWidget {
  const ThemeSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DynamicAppBar(
        title: (_, __) => const Text('显示与色彩'),
      ),
      body: ListView(
        children: const [
          CardExternalTitle('外观'),
          _ThemeModeSwitchCard(),
          CardExternalTitle('颜色'),
          _ThemePrimaryColorCard(),
        ],
      ),
    );
  }
}

class _ThemeModeSwitchCard extends StatelessWidget {
  const _ThemeModeSwitchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Icon(Icons.light_mode),
                  Text('亮色'),
                  _ThemeModeRadio(Brightness.light),
                ],
              ),
              Column(
                children: const [
                  Icon(Icons.dark_mode),
                  Text('暗色'),
                  _ThemeModeRadio(Brightness.dark),
                ],
              ),
            ],
          ),
          const Divider(height: 0, indent: 16),
          const _AutoSwitchModeTile(),
        ],
      ),
    );
  }
}

class _AutoSwitchModeTile extends ConsumerWidget {
  const _AutoSwitchModeTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeMode mode =
        ref.watch($ThemeProvider.select((value) => value.mode));

    return SwitchListTile(
      value: mode == ThemeMode.system,
      title: const Text('自动'),
      subtitle: const Text('开启后将跟随系统自动切换'),
      onChanged: (bool auto) {
        final ThemeNotifier notifier = ref.watch($ThemeProvider.notifier);
        if (auto) {
          return notifier.update(
            mode: ThemeMode.system,
          );
        }

        final Brightness brightness = Theme.of(context).brightness;
        return notifier.update(
          mode:
              brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
        );
      },
    );
  }
}

class _ThemeModeRadio extends ConsumerWidget {
  const _ThemeModeRadio(this.brightness, {Key? key}) : super(key: key);

  final Brightness brightness;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Brightness current = Theme.of(context).brightness;

    return Radio<Brightness>(
      value: current,
      groupValue: brightness,
      onChanged: (_) {
        ref.read($ThemeProvider.notifier).update(
              mode: current == Brightness.light
                  ? ThemeMode.dark
                  : current == Brightness.dark
                      ? ThemeMode.light
                      : null,
            );
      },
    );
  }
}

class _ThemePrimaryColorCard extends StatelessWidget {
  const _ThemePrimaryColorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      padding: const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          mainAxisSpacing: 0,
          children: [
            const _ThemePrimaryColorTile(kDefaultPrimaryColor),
            for (Color color in Colors.primaries) _ThemePrimaryColorTile(color),
          ],
        ),
      ),
    );
  }
}

class _ThemePrimaryColorTile extends ConsumerWidget {
  const _ThemePrimaryColorTile(this.color, {Key? key}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color current =
        ref.watch($ThemeProvider.select((value) => value.primaryColor));

    return GestureDetector(
      onTap: () {
        ref.read($ThemeProvider.notifier).update(primaryColor: color);
      },
      child: Container(
        color: color,
        child: Center(
          child: Text(
            _generateColorName(color),
            style: TextStyle(
              color: current == color ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  String _generateColorName(Color color) {
    if (color == kDefaultPrimaryColor) return 'Socfony Purple';

    return '#' +
        color.value
            .toRadixString(16)
            .padLeft(8, '0')
            .substring(2)
            .toUpperCase();
  }
}
