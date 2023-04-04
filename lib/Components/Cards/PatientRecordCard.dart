import 'package:flutter/material.dart';
import 'package:patient_data_manager/Res/Theme/themes.dart';
import 'package:patient_data_manager/Screen/ManagePatient.dart';
import 'package:patient_data_manager/Screen/UpdatePatientRecord.dart';
import 'package:patient_data_manager/Screen/UpdatePatient.dart';
import 'package:patient_data_manager/Services/APIs.dart';

class PatientRecordCard extends StatelessWidget {
  final String dataName;
  final String value;
  final String description;
  final String time;
  final String patientId;
  final String recordId;

  const PatientRecordCard({
    Key? key,
    required this.dataName,
    required this.value,
    this.description = '',
    required this.time,
    required this.patientId,
    required this.recordId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onDeletePatientRecordConfirmation() async {
      // Perform delete operation

      var res = await PatientsDataServer()
          .deletePatientRecord(recordId)
          .catchError((e) {
        debugPrint(e);
      });
      if (res == null) return;

      Navigator.of(context).pop();
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
    }

    onDeletePressed() {
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: onDeletePatientRecordConfirmation,
                  child: const Text('Delete')),
            ],
          );
        },
      );
    }

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
              Expanded(
                  child: Column(
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
                    'Time: $time',
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
              )),
              const SizedBox(width: 8.0),
              IconButton(
                onPressed: onDeletePressed,
                icon: const Icon(
                  Icons.delete,
                  size: 24.0,
                ),
              ),
              const SizedBox(width: 8.0),
              IconButton(
                onPressed: () {
                  //handle update button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdatePatientRecord(
                        patientId: patientId,
                        recordId: recordId,
                        dataType: dataName,
                        value: value,
                        description: description,
                        time: time,
                      ),
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
