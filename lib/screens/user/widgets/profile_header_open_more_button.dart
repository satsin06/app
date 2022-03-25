import 'package:flutter/material.dart';

class ProfileHeaderOpenMoreButton extends StatelessWidget {
  const ProfileHeaderOpenMoreButton(this.userId, {Key? key}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_horiz),
      itemBuilder: _itemBuilder,
    );
  }

  List<PopupMenuEntry> _itemBuilder(BuildContext context) {
    return const <PopupMenuEntry>[
      PopupMenuItem(
        child: ListTile(
          dense: true,
          leading: Icon(Icons.report_problem),
          title: Text('举报'),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          dense: true,
          leading: Icon(Icons.share),
          title: Text('分享'),
        ),
      ),
    ];
  }
}
