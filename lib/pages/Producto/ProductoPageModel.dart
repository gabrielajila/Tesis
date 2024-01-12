import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ProductoPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for iuser widget.
  bool iuserHovered1 = false;
  // State field(s) for iuser widget.
  bool iuserHovered2 = false;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
