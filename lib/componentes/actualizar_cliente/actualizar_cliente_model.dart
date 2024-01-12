import 'package:facturito/flutter_flow/form_field_controller.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class AdquirienteModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? identificacionTextController;
  String? Function(BuildContext, String?)?
      identificacionTextControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? razonSocialTextController;
  String? Function(BuildContext, String?)? razonSocialTextControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? direccionTextController;
  String? Function(BuildContext, String?)? direccionTextControllerValidator;

  TextEditingController? descuentoTextController;
  String? Function(BuildContext, String?)? descuentoTextControllerValidator;

  String? tipoIdentificacionDropDownValue;
  FormFieldController<String>? tipoIdentificacionDropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    identificacionTextController?.dispose();
    razonSocialTextController?.dispose();
    emailTextController?.dispose();
    telefonoTextController?.dispose();
    direccionTextController?.dispose();
    tipoIdentificacionDropDownValueController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
