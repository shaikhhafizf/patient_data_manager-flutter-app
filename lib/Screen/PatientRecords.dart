import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patient_data_manager/Components/Cards/PatientRecordCard.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBar.dart';
import 'package:patient_data_manager/Components/TopBar/TopBarWithoutSearchBarWithRefresh.dart';
import 'package:patient_data_manager/Screen/UpdatePatientRecord.dart';
import 'package:patient_data_manager/Services/APIs.dart';
import '../Res/Theme/themes.dart';
import './UpdatePatient.dart';

class PatientRecords extends StatefulWidget {
  final String title;
  final String patientId;
  const PatientRecords(
      {super.key, required this.title, required this.patientId});

  @override
  State<PatientRecords> createState() => _PatientRecordsState();
}

class _PatientRecordsState extends State<PatientRecords> {
  List<dynamic> dataList = [];

  Future<void> fetchData() async {
    debugPrint('dka ${widget.patientId}');
    var res = await PatientsDataServer()
        .getPatientRecords(widget.patientId)
        .catchError((e) {
      debugPrint('Error.patientrecords.fetch $e');
    });
    if (res == null) return;
    setState(() {
      debugPrint(res);
      dataList = json.decode(res);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWithoutSearchBarWithRefresh(
        title: widget.title,
        onRefresh: () {
          fetchData();
        },
      ),
      body: Center(
        child: dataList.isNotEmpty
            ? ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = dataList[index];
                  return PatientRecordCard(
                    dataName: item['type'],
                    description: item['description'] ?? '',
                    time: item['dateTime'],
                    value: item['value'],
                    patientId: widget.patientId,
                    recordId: item['id'],
                  );
                },
              )
            : const Text('No Data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UpdatePatientRecord(
                        patientId: widget.patientId,
                      )))
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
