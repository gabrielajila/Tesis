import '/flutter_flow/flutter_flow_util.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future getDataQr(String? codigoQR) async {
  // Add your function code here!
  List<String> strarray = codigoQR!.split(";");
  FFAppState().identificacionA = strarray[0];
  FFAppState().razonSocialA = strarray[1];
  FFAppState().direccionA = strarray[2];
  FFAppState().telefonoA = strarray[3];
  FFAppState().correoA = strarray[4];
}
