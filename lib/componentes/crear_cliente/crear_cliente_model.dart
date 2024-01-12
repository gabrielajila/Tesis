import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CrearClienteModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? cedula;
  String? Function(BuildContext, String?)? cedulaController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? nombre;
  String? Function(BuildContext, String?)? nombreController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? correo;
  String? Function(BuildContext, String?)? correoController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? telefono;
  String? Function(BuildContext, String?)? telefonoController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? direccion;
  String? Function(BuildContext, String?)? direccionController5Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    cedula?.dispose();
    nombre?.dispose();
   correo?.dispose();
    telefono?.dispose();
    direccion?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
