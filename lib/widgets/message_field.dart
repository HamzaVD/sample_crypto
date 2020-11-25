import 'package:flutter/material.dart';

class MessageField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String text;
  const MessageField({
    this.textEditingController,
    this.text,
  });
  @override
  _MessageFieldState createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(labelText: widget.text),
    );
  }
}
