import 'package:flutter/material.dart';

class OptionLabel extends StatelessWidget {
  final String text;
  final bool isBold;
  const OptionLabel({super.key, required this.text, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      overflow: TextOverflow.visible,
      maxLines: null,
      softWrap: true,
      style: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
