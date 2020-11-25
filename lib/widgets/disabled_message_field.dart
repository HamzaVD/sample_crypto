import 'package:flutter/material.dart';

class DisabledMessageField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String text;
  const DisabledMessageField({
    this.textEditingController,
    this.text,
  });
  @override
  _DisabledMessageFieldState createState() => _DisabledMessageFieldState();
}

class _DisabledMessageFieldState extends State<DisabledMessageField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      enabled: false,
      decoration: InputDecoration(labelText: widget.text),
    );
  }
}
