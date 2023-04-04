import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_manager/Components/Buttons/FormButton.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDateField.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDropDownField.dart';

import 'package:patient_data_manager/Components/FormFields/CustomTextField.dart';
import 'package:patient_data_manager/Components/Text/Label.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBar.dart';
import 'package:patient_data_manager/Res/Theme/themes.dart';
import 'package:patient_data_manager/Screen/PatientRecords.dart';
import 'package:patient_data_manager/Screen/UpdatePatient.dart';
import 'package:patient_data_manager/Services/APIs.dart';

class ManagePatient extends StatefulWidget {
  final String patientId;

  final String firstName;

  final String lastName;

  final String address;

  final String phone;

  final String gender;

  final String email;

  final String dob;

  final String age;

  const ManagePatient(
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
  State<ManagePatient> createState() => _ManagePatientState();
}

class _ManagePatientState extends State<ManagePatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWithoutSearchBar(
        title: "Add or Update Patient",
        dropdownItems: const ['View Records', 'Update', 'Delete'],
        onDropdownItemSelected: (value) {
          if (value == 'View Records') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PatientRecords(
                        title: 'Patient Records',
                        patientId: widget.patientId)));
          } else if (value == 'Update') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UpdatePatient(
                          address: widget.address,
                          dob: widget.dob,
                          email: widget.email,
                          age: widget.age,
                          gender: widget.gender,
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          patientId: widget.patientId,
                          phone: widget.phone,
                        )));
          } else if (value == 'Delete') {
            debugPrint('delete');
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Delete item?',
                    style: TextStyle(color: Colors.black),
                  ),
                  content: const Text(
                    'Are you sure you want to delete this item?',
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Delete'),
                      onPressed: () async {
                        // Perform delete operation

                        var res = await PatientsDataServer()
                            .deletePatients(widget.patientId)
                            .catchError((e) {
                          debugPrint(e);
                        });
                        if (res == null) return;

                        Navigator.of(context).pop();
                        Navigator.pop(context);
                        // Show success dialog
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
                                'The patient has been deleted.',
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
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Themes.accentColor,
          margin: const EdgeInsets.only(top: 32.0, left: 20, right: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Label(
                        text: 'Name',
                      ),
                      Label(
                        text: 'Age',
                      ),
                      Label(
                        text: 'Gender',
                      ),
                      Label(
                        text: 'Email',
                      ),
                      Label(
                        text: 'Phone number',
                      ),
                      Label(
                        text: 'Address',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Label(text: '${widget.firstName} ${widget.lastName}'),
                      Label(text: widget.age),
                      Label(text: widget.gender),
                      Label(text: widget.email),
                      Label(text: widget.phone),
                      Label(text: widget.address),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
