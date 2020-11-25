import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;

  const HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
