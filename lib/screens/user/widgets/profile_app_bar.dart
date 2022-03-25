import 'dart:math';

import 'package:flutter/material.dart';
import 'package:socfony/hive/models/app_theme.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  ScrollNotificationObserverState? _scrollNotificationObserverState;
  double _opacity = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_scrollNotificationObserverState != null) {
      _scrollNotificationObserverState!
          .removeListener(_handleScrollNotification);
      _scrollNotificationObserverState = null;
    }

    _scrollNotificationObserverState ??= ScrollNotificationObserver.of(context);
    _scrollNotificationObserverState?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    _scrollNotificationObserverState?.removeListener(_handleScrollNotification);
    _scrollNotificationObserverState = null;
    super.dispose();
  }

  double get height => AppBar.preferredHeightFor(context, widget.preferredSize);

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final double screenWidth = MediaQuery.of(context).size.width;
      final double pixels = notification.metrics.pixels;
      final double opacity = pixels / screenWidth;
      if (opacity != _opacity && opacity <= 2.0) {
        setState(() {
          _opacity = max(0.0, min(1.0, opacity));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color backgroundColor =
        (theme.appBarTheme.backgroundColor ?? theme.backgroundColor)
            .withOpacity(_opacity);

    return AppBar(
      toolbarHeight: height,
      backgroundColor: backgroundColor,
    );
  }
}
