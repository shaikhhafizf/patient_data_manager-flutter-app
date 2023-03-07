import 'dart:math';

import 'package:flutter/material.dart';
import 'package:patient_data_manager/Components/Cards/PatientCard.dart';
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

  final List<Map<String, dynamic>> data = [
    {'name': 'John Doe', 'gender': 'Male', 'age': 30},
    {'name': 'Jane Doe', 'gender': 'Female', 'age': 25},
    {'name': 'Bob Smith', 'gender': 'Male', 'age': 45},
  ];
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
    final response =
        await http.get(Uri.parse('http://192.168.0.19:3009/patients'));
    if (response.statusCode == 200) {
      setState(() {
        dataList = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: widget.title,
        onSearchPressed: widget.onSearchPressed,
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
            return PatientCard(
              age: 'Age: ${item['age']}',
              gender: 'Gender: ${item['gender']}',
              name: 'Name: ${item['firstName']} ${item['lastName']}',
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
