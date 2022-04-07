import 'dart:math' show max, min;

import 'package:flutter/material.dart';

typedef _Type<T> = T Function(BuildContext, double);

class DynamicAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DynamicAppBar({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.toolbarHeight,
    this.bottom,
    this.backgroundColor,
    this.actions,
    this.title,
    this.leading,
    this.leadingWidth,
  }) : super(key: key);

  final bool automaticallyImplyLeading;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final _Type<Color?>? backgroundColor;
  final _Type<List<Widget>?>? actions;
  final _Type<Widget?>? title;
  final double? leadingWidth;
  final _Type<Widget>? leading;

  @override
  State<DynamicAppBar> createState() => _DynamicAppBarState();

  @override
  Size get preferredSize {
    final double toolbarHeight = this.toolbarHeight ?? kToolbarHeight;
    final double bottomHeight = bottom?.preferredSize.height ?? 0.0;
    final double height = toolbarHeight + bottomHeight;

    return Size.fromHeight(height);
  }
}

class _DynamicAppBarState extends State<DynamicAppBar> {
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

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final double pixels = notification.metrics.pixels;
      final double opacity = pixels / 120.0;
      if (opacity != _opacity && opacity <= 2.0) {
        setState(() {
          _opacity = max(0.0, min(1.0, opacity));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _Type<Color?> backgroundColor =
        widget.backgroundColor ?? _defaultBackgroundColor;

    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      actions: widget.actions?.call(context, _opacity),
      toolbarHeight: widget.preferredSize.height -
          (widget.bottom?.preferredSize.height ?? 0),
      backgroundColor: backgroundColor.call(context, _opacity),
      bottom: widget.bottom,
      title: widget.title?.call(context, _opacity),
      leadingWidth: widget.leadingWidth,
      leading: widget.leading?.call(context, _opacity),
    );
  }

  Color _defaultBackgroundColor(BuildContext context, double opacity) {
    final ThemeData theme = Theme.of(context);
    final Color color =
        theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface;

    return color.withOpacity(opacity);
  }
}
