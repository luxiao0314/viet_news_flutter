import 'package:flutter/material.dart';

class MyCloseButton<T> extends StatelessWidget {
  final T result;

  const MyCloseButton({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      onPressed: () {
        Navigator.maybePop(context, result);
      },
    );
  }
}
