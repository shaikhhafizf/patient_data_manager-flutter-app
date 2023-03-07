import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const FormButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
      ),
      child: Text(label),
    );
  }
}
