import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String host = 'http://192.168.0.19:3009/';

class PatientsDataServer {
  var client = http.Client();

  //Get Patients list
  Future<dynamic> patients() async {
    var url = Uri.parse('${host}patients');
    var response = await http.get(url);
    debugPrint('loading..');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  //Adding or editing Patient Data
  Future<dynamic> updatePatientData(dynamic payload) async {
    // Update If patient ID available
    var url = Uri.parse(
        '${host}patients${payload['patientId'] == null ? '' : "/${payload['patientId']}"}');

    // debugPrint(payload['patientId'].toString());x
    var _payload = json.encode(payload);
    debugPrint(_payload.toString());

    var response = await client.post(url,
        headers: {"content-type": "application/json"}, body: _payload);
    debugPrint(' working');
    if (response.statusCode == 200) {
      debugPrint(' working');
      return response.body;
    } else {
      debugPrint('not working');
      throw Exception('Failed to fetch data');
    }
  }

  //Get Patients list
  Future<dynamic> deletePatients(id) async {
    var url = Uri.parse('${host}patients/$id');
    debugPrint(url.toString());
    var response = await http.delete(url);
    debugPrint('loading..');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
