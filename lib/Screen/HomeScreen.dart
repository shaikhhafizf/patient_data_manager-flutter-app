import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patient_data_manager/Components/Cards/PatientCard.dart';
import 'package:patient_data_manager/Services/APIs.dart';
import '../Components/TopBar/TopBar.dart';
import '../Res/Theme/themes.dart';
import './UpdatePatient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {super.key,
      required this.title,
      required this.onMenuPressed,
      required this.onSearchPressed});
  final String title;
  final VoidCallback onMenuPressed;
  final VoidCallback onSearchPressed;

  final List<Map<String, dynamic>> dataList = [];
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> dataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var res = await PatientsDataServer().patients().catchError((e) {
      debugPrint(e);
    });
    if (res == null) return;

    setState(() {
      dataList = json.decode(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: widget.title,
        onSearchPressed: widget.onSearchPressed,
        onRefresh: () {
          fetchData();
        },
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Themes.primaryColor,
            ),
            child: Text(
              'Hello,',
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .onPrimary, // set the text color
                fontSize: 32.0, // set the font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title: const Text('All Patients'),
            onTap: () {
              // Handle item 1 press
            },
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () {
              // Handle item 2 press
            },
          ),
        ],
      )),
      body: Center(
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = dataList[index];
            final date = item['dob'].toString().split('-');
            debugPrint(item['dob'].toString());
            return PatientCard(
              age: item['age'].toString(),
              gender: item['gender'],
              name: 'Name: ${item['firstName']} ${item['lastName']}',
              address: item['Address'],
              dob: item['dob'].toString(),
              // '${date[2]}-${num.parse(date[1]) < 10 ? '0${date[1]}' : date[1]}-${num.parse(date[0]) < 10 ? '0${date[0]}' : date[0]}',
              email: item['email'],
              firstName: item['firstName'],
              lastName: item['lastName'],
              patientId: item['id'],
              phone: item['phoneNumber'],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UpdatePatient()))
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
