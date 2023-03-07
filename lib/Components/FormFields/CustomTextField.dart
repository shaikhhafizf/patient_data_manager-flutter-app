import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:patient_data_manager/Res/Theme/themes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.keyboardType,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Themes.accentColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType ?? TextInputType.text,
        style: const TextStyle(color: Colors.black),
        validator: validator,
      ),
    );
  }
}
