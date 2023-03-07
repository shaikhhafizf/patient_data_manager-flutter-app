import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_manager/Components/Buttons/FormButton.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDateField.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDropDownField.dart';

import 'package:patient_data_manager/Components/FormFields/CustomTextField.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBar.dart';

class UpdatePatienData extends StatefulWidget {
  const UpdatePatienData({super.key});

  @override
  State<UpdatePatienData> createState() => _UpdatePatienDataState();
}

class _UpdatePatienDataState extends State<UpdatePatienData> {
  final _formKey = GlobalKey<FormState>();
  final _dataType = TextEditingController();
  final _description = TextEditingController();
  final _value = TextEditingController();
  DateTime _time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarWithoutSearchBar(title: "Add or Update Patient"),
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
                      return 'Please enter your first name';
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
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                CustomDateField(
                  label: 'Time',
                  onChanged: (date) {
                    // Do something with the selected date
                  },
                  initialDate: DateTime(2000, 1, 1),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ),
                CustomTextField(
                  controller: _value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  labelText: 'Value',
                ),
                const SizedBox(height: 16),
                FormButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform some action here
                    }
                  },
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
