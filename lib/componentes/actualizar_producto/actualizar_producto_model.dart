import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class ProductoFormModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? codigoTextController;
  String? Function(BuildContext, String?)? codigoTextControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? precioTextController;
  String? Function(BuildContext, String?)? precioTextControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? infoAdicionalTextController;
  String? Function(BuildContext, String?)? infoAdicionalTextControllerValidator;
  // State field(s) for DropDown widget.
  TextEditingController? ivaTextController;
  String? Function(BuildContext, String?)? ivaTextControllerValidator;

  String? ivaDropDownValue;
  FormFieldController<String>? ivaDropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    codigoTextController?.dispose();
    nombreTextController?.dispose();
    precioTextController?.dispose();
    infoAdicionalTextController?.dispose();
    ivaDropDownValueController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
