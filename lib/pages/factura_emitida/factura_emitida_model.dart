import '/componentes/calendario/calendario_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class FacturaEmitidaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for calendario component.
  late CalendarioModel calendarioModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarioModel = createModel(context, () => CalendarioModel());
  }

  void dispose() {
    unfocusNode.dispose();
    calendarioModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
