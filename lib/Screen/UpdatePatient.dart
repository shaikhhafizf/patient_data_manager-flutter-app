import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_manager/Components/Buttons/FormButton.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDateField.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDropDownField.dart';

import 'package:patient_data_manager/Components/FormFields/CustomTextField.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBar.dart';

class UpdatePatient extends StatefulWidget {
  const UpdatePatient({super.key});

  @override
  State<UpdatePatient> createState() => _UpdatePatientState();
}

class _UpdatePatientState extends State<UpdatePatient> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  String _gender = 'Male';
  DateTime _dob = DateTime.now();
  final _dobController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

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
                  controller: _firstNameController,
                  labelText: 'First Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: _lastNameController,
                  labelText: 'Last Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: _ageController,
                  labelText: 'Age',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                CustomDropDownField(
                  label: 'Gender',
                  onChanged: (value) {
                    // Do something with the selected value
                  },
                  value: 'Male',
                  items: const ['Male', 'Female'],
                ),
                CustomDateField(
                  label: 'Date of Birth',
                  onChanged: (date) {
                    // Do something with the selected date
                  },
                  initialDate: DateTime(2000, 1, 1),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ),
                CustomTextField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  labelText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
                CustomTextField(
                  controller: _phoneController,
                  labelText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: _addressController,
                  labelText: 'Address',
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
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
