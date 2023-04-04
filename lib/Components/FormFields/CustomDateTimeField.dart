import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_manager/Res/Theme/themes.dart';

class CustomDateTimeField extends StatefulWidget {
  final String label;
  final Function(DateTime?)? onChanged;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  CustomDateTimeField({
    required this.label,
    this.onChanged,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  @override
  _CustomDateTimeFieldState createState() => _CustomDateTimeFieldState();
}

class _CustomDateTimeFieldState extends State<CustomDateTimeField> {
  late DateTime? _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = widget.initialDate ?? DateTime.now();
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
            initialDate: _dateTime!,
            firstDate: widget.firstDate ?? DateTime(1900),
            lastDate: widget.lastDate ?? DateTime.now(),
          );
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(_dateTime!),
            );
            if (time != null) {
              final dateTime = DateTime(
                  date.year, date.month, date.day, time.hour, time.minute);
              setState(() {
                _dateTime = dateTime;
              });
              widget.onChanged?.call(dateTime);
            }
          }
        },
        readOnly: true,
        controller: TextEditingController(
          text: _dateTime != null
              ? DateFormat('dd-MM-yyyy HH:mm').format(_dateTime!)
              : '',
        ),
      ),
    );
  }
}
