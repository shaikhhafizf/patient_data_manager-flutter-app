import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_manager/Components/Buttons/FormButton.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDateField.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDropDownField.dart';

import 'package:patient_data_manager/Components/FormFields/CustomTextField.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBar.dart';
import 'package:http/http.dart' as http;
import 'package:patient_data_manager/Services/APIs.dart';

class UpdatePatient extends StatefulWidget {
  final String patientId;

  final String firstName;

  final String lastName;

  final String address;

  final String phone;

  final String gender;

  final String email;

  final String dob;

  final String age;

  const UpdatePatient(
      {super.key,
      this.patientId = '',
      this.firstName = '',
      this.lastName = '',
      this.age = '',
      this.gender = 'Male',
      this.dob = '2000-01-01',
      this.email = '',
      this.phone = '',
      this.address = ''});

  @override
  State<UpdatePatient> createState() => _UpdatePatientState();
}

class _UpdatePatientState extends State<UpdatePatient> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  // final _genderController = TextEditingController();
  String _gender = 'Male';
  DateTime _dob = DateTime(2000, 1, 1);
  // final _dobController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.firstName;
    _lastNameController.text = widget.lastName;
    _ageController.text = widget.age;
    _gender = widget.gender;
    _dob = DateTime.parse(widget.dob);
    _emailController.text = widget.email;
    _addressController.text = widget.address;
  }

  submitData() async {
    if (_formKey.currentState!.validate()) {
      final data = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'age': int.parse(_ageController.text),
        'gender': _gender,
        'dob': DateFormat('yyyy-MM-dd').format(_dob),
        'email': _emailController.text,
        'phoneNumber': _phoneController.text,
        'Address': _addressController.text,
        'patientId': widget.patientId == '' ? null : widget.patientId
      };
      var res =
          await PatientsDataServer().updatePatientData(data).catchError((e) {
        debugPrint('e');
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
            content: const Text(
              'The patient added.',
              style: TextStyle(color: Colors.black),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWithoutSearchBar(
          title: "${widget.patientId == '' ? "Add" : "Update"} Patient"),
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
                    _gender = value!;
                  },
                  value: _gender,
                  items: const ['Male', 'Female'],
                ),
                CustomDateField(
                  label: 'Date of Birth',
                  onChanged: (date) {
                    // Do something with the selected date
                    _dob = date!;
                  },
                  initialDate: _dob,
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
                  onPressed: submitData,
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
