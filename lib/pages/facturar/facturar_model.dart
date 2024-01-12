import 'package:facturito/flutter_flow/form_field_controller.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FacturarModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  var valorQR = '';

  //CONTROLLERS FOR ADQUIRIENTE

  TextEditingController? identificacionTextController;
  String? Function(BuildContext, String?)?
      identificacionTextControllerValidator;

  TextEditingController? razonSocialTextController;
  String? Function(BuildContext, String?)? razonSocialTextControllerValidator;

  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;

  TextEditingController? direccionTextController;
  String? Function(BuildContext, String?)? direccionTextControllerValidator;

  TextEditingController? descuentoTextController;
  String? Function(BuildContext, String?)? descuentoTextControllerValidator;

  String? tipoIdentificacionDropDownValue;
  FormFieldController<String>? tipoIdentificacionDropDownValueController;

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for txtMonto widget.
  TextEditingController? txtMontoController;
  String? Function(BuildContext, String?)? txtMontoControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    identificacionTextController?.dispose();
    razonSocialTextController?.dispose();
    emailTextController?.dispose();
    telefonoTextController?.dispose();
    direccionTextController?.dispose();
    tipoIdentificacionDropDownValueController?.dispose();

    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    textController6?.dispose();
    txtMontoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
