import 'package:flutter/material.dart';
import 'package:patient_data_manager/Res/Theme/themes.dart';
import 'package:patient_data_manager/Screen/ManagePatient.dart';
import 'package:patient_data_manager/Screen/UpdatePatienData.dart';
import 'package:patient_data_manager/Screen/UpdatePatient.dart';

class PatientDataCard extends StatelessWidget {
  const PatientDataCard({
    Key? key,
    required this.dataName,
    required this.value,
    required this.description,
    required this.time,
  }) : super(key: key);

  final String dataName;
  final String value;
  final String description;
  final String time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const ManagePatient()))
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Themes.accentColor,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$dataName: $value',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Time: $description',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Date: $time',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  //handle update button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdatePatient(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  size: 24.0,
                ),
              ),
              const SizedBox(width: 16.0),
              IconButton(
                onPressed: () {
                  //handle update button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdatePatienData(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
