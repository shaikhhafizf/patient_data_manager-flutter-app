import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patient_data_manager/Components/Cards/PatientDataCard.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBar.dart';
import 'package:patient_data_manager/Screen/UpdatePatienData.dart';
import '../Res/Theme/themes.dart';
import './UpdatePatient.dart';

class PatientData extends StatefulWidget {
  PatientData({
    super.key,
    required this.title,
  });
  final String title;

  final List<Map<String, dynamic>> data = [
    {
      'dataName': 'Blood pressure',
      'description': 'Systolic / Diastolic',
      'time': 'Today, 10:30 AM',
      'value': '120 / 80',
    },
    {
      'dataName': 'Heart rate',
      'description': 'Resting heart rate',
      'time': 'Yesterday, 8:45 PM',
      'value': '72 bpm',
    },
    {
      'dataName': 'Temperature',
      'description': 'Oral',
      'time': '2 days ago, 3:15 PM',
      'value': '98.6 °F',
    },
  ];
  @override
  State<PatientData> createState() => _PatientDataState();
}

class _PatientDataState extends State<PatientData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWithoutSearchBar(
        title: widget.title,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            final item = widget.data[index];
            return PatientDataCard(
              dataName: item['dataName'],
              description: item['description'],
              time: item['time'],
              value: item['value'],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UpdatePatienData()))
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
