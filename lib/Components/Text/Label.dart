import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final bool isBold;
  const Label({super.key, required this.text, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        overflow: TextOverflow.visible,
        maxLines: null,
        softWrap: true,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
