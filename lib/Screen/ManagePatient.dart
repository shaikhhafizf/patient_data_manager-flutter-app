import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_data_manager/Components/Buttons/FormButton.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDateField.dart';
import 'package:patient_data_manager/Components/FormFields/CustomDropDownField.dart';

import 'package:patient_data_manager/Components/FormFields/CustomTextField.dart';
import 'package:patient_data_manager/Components/Text/Label.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBar.dart';
import 'package:patient_data_manager/Res/Theme/themes.dart';
import 'package:patient_data_manager/Screen/PatientData.dart';
import 'package:patient_data_manager/Screen/UpdatePatient.dart';

class ManagePatient extends StatefulWidget {
  const ManagePatient({super.key});

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
                    builder: (context) => PatientData(
                          title: 'Patient Data',
                        )));
          } else if (value == 'Update') {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UpdatePatient()));
          } else if (value == 'Delete') {
            debugPrint('delete');
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
                    children: const [
                      Label(text: "FirstName LastName"),
                      Label(text: "34"),
                      Label(text: "Male"),
                      Label(text: "FirtsName@gmail.com"),
                      Label(text: "+1 647 566 1123"),
                      Label(text: "215 eglinton, Scarborogh, M1J5C7"),
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
