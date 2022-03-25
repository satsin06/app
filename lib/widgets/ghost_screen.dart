import 'package:flutter/material.dart';

class GhostScreen extends StatelessWidget {
  const GhostScreen({
    Key? key,
    this.title = 'Oh no!',
    this.message,
    this.messageText = '似乎发生了一些意外。',
    this.button,
    this.buttonText = '返回',
    this.buttonLocation = FloatingActionButtonLocation.endFloat,
    this.onButtonPressed,
  }) : super(key: key);

  /// The title of the ghost screen.
  final String title;

  /// The message of the ghost screen.
  final Widget? message;

  /// The message text of the ghost screen.
  final String messageText;

  /// The button of the ghost screen.
  final Widget? button;

  /// The button text of the ghost screen.
  final String buttonText;

  /// The button location of the ghost screen.
  final FloatingActionButtonLocation buttonLocation;

  /// The button pressed callback of the ghost screen.
  final void Function(BuildContext context)? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final Widget _button = button ??
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
          onPressed: () {
            if (onButtonPressed != null) {
              return onButtonPressed?.call(context);
            }

            Navigator.of(context).pop();
          },
          child: Text(buttonText),
        );
    final Widget _message = message ??
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            messageText,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        );

    return Scaffold(
      floatingActionButton: _button,
      floatingActionButtonLocation: buttonLocation,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/ghost.png',
              height: 140,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 6),
          _message,
        ],
      ),
    );
  }
}
