import 'package:flutter/material.dart';
import 'package:patient_data_manager/Res/Theme/themes.dart';

class CustomDropDownField extends StatefulWidget {
  final String label;
  final Function(String?)? onChanged;
  final String? value;
  final List<String>? items;

  CustomDropDownField({
    required this.label,
    this.onChanged,
    this.value,
    this.items,
  });

  @override
  _CustomDropDownFieldState createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  late String? _gender;

  @override
  void initState() {
    super.initState();
    _gender = widget.value ?? widget.items?.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Themes.accentColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        padding: const EdgeInsets.only(left: 16.0, right: 8.0),
        child: DropdownButtonFormField<String>(
          value: _gender,
          decoration: InputDecoration(
              labelText: widget.label, border: InputBorder.none),
          style: const TextStyle(color: Colors.black),
          items: widget.items
              ?.map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _gender = value;
            });
            widget.onChanged?.call(value);
          },
        ));
  }
}
