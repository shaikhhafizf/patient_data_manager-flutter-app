import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_manager/Components/Buttons/FormButton.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDateField.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDateTimeField.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDropDownField.dart';

import 'package:patient_data_manager/Components/FormFields/CustomTextField.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBar.dart';
import 'package:patient_data_manager/Services/APIs.dart';

class UpdatePatientRecord extends StatefulWidget {
  final String recordId;

  final String patientId;
  final String dataType;
  final String value;
  final String description;
  final String time;

  const UpdatePatientRecord({
    super.key,
    this.recordId = '',
    required this.patientId,
    this.dataType = '',
    this.value = '',
    this.description = '',
    this.time = '',
  });

  @override
  State<UpdatePatientRecord> createState() => _UpdatePatientRecordState();
}

class _UpdatePatientRecordState extends State<UpdatePatientRecord> {
  final _formKey = GlobalKey<FormState>();
  final _dataType = TextEditingController();
  final _description = TextEditingController();
  final _value = TextEditingController();
  DateTime _time = DateTime.now();

  submitRecord() async {
    if (_formKey.currentState!.validate()) {
      final data = {
        'patientId': widget.patientId,
        'type': _dataType.text,
        'value': _value.text,
        'dateTime': DateFormat('yyyy-MM-dd hh:mm').format(_time),
        'description': _description.text,
        'recordId': widget.recordId == '' ? null : widget.recordId
      };
      var res =
          await PatientsDataServer().updatePatientRecord(data).catchError((e) {
        debugPrint(e.toString());
      });
      if (res == null) return;
      Navigator.pop(context);

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Success',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              widget.recordId == ''
                  ? 'The patient record added.'
                  : 'The patient record updated.',
              style: const TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _dataType.text = widget.dataType;
    _description.text = widget.description;
    _value.text = widget.value;
    if (widget.time == '') {
      _time = DateTime.now();
    } else {
      _time = DateFormat('MM-dd-yyyy HH:mm').parse(widget.time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWithoutSearchBar(
          // ignore: unnecessary_null_comparison
          title: "${widget.recordId == '' ? 'Add' : 'Update'} Patient"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: _dataType,
                  labelText: 'Data Type',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter data type';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: _description,
                  labelText: 'data note or Description',
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter data note or description';
                    }
                    return null;
                  },
                ),
                CustomDateTimeField(
                  label: 'Time',
                  onChanged: (date) {
                    // Do something with the selected date
                    _time = date!;
                  },
                  initialDate: _time,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ),
                CustomTextField(
                  controller: _value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter data value';
                    }
                    return null;
                  },
                  labelText: 'Value',
                ),
                const SizedBox(height: 16),
                FormButton(
                  onPressed: submitRecord,
                  label: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
