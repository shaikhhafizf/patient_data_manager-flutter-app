import 'package:flutter/material.dart';
import 'package:patient_data_manager/Res/Theme/themes.dart';
import 'package:patient_data_manager/Screen/ManagePatient.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {super.key, required this.name, required this.age, required this.gender});
  final String name;
  final String age;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ManagePatient()))
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Themes.accentColor,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Text(
                            gender,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Text(
                            age,
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      //handle update button press
                    },
                    child: const Text('Update'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
