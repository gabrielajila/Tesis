// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future getDataQR(String? codqr) async {
  // Add your function code here!
  List<String> strarray = codqr!.split(";");
  FFAppState().identificacion = strarray[0];
  FFAppState().razonSocial = strarray[1];
  FFAppState().direccion = strarray[2];
  FFAppState().telefono = strarray[3];
  FFAppState().correo = strarray[4];
}
