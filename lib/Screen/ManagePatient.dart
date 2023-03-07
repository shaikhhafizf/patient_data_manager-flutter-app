import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_manager/Components/Buttons/FormButton.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDateField.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDropDownField.dart';

import 'package:patient_data_manager/Components/FormFields/CustomTextField.dart';
import 'package:patient_data_manager/Components/TopBar/TopBar.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBar.dart';

class ManagePatient extends StatefulWidget {
  const ManagePatient({super.key});

  @override
  State<ManagePatient> createState() => _ManagePatientState();
}

class _ManagePatientState extends State<ManagePatient> {
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
    return const Scaffold(
      appBar: TopBarWithoutSearchBar(title: "Add or Update Patient"),
      body: SingleChildScrollView(),
    );
  }
}
