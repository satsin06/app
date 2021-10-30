import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenDialogWrapper extends StatelessWidget {
  const FullScreenDialogWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        color: Theme.of(context).cardColor,
        child: Text('111'),
      ),
    );
  }
}