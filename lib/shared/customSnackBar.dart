import 'package:facturito/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    BuildContext context, String mensaje) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        mensaje,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Outfit',
              color: Color.fromARGB(255, 248, 248, 249),
            ),
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: Color.fromARGB(255, 78, 75, 75),
    ),
  );
}
