import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Function function;

  const ActionButton({this.text, this.function});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RaisedButton(
            color: Colors.purple[200],
            onPressed: function,
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
