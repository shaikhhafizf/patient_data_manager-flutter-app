import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_manager/Res/Theme/themes.dart';

class CustomDateField extends StatefulWidget {
  final String label;
  final Function(DateTime?)? onChanged;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  CustomDateField({
    required this.label,
    this.onChanged,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  @override
  _CustomDateFieldState createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  late DateTime? _dob;

  @override
  void initState() {
    super.initState();
    _dob = widget.initialDate ?? DateTime.now();
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
      child: TextFormField(
        decoration:
            InputDecoration(labelText: widget.label, border: InputBorder.none),
        style: const TextStyle(color: Colors.black),
        onTap: () async {
          final date = await showDatePicker(
            context: context,
            initialDate: _dob!,
            firstDate: widget.firstDate ?? DateTime(1900),
            lastDate: widget.lastDate ?? DateTime.now(),
          );
          if (date != null) {
            setState(() {
              _dob = date;
            });
            widget.onChanged?.call(date);
          }
        },
        readOnly: true,
        controller: TextEditingController(
          text: _dob != null ? DateFormat('dd-MM-yyyy').format(_dob!) : '',
        ),
      ),
    );
  }
}
