import 'package:facturito/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

String? validarInput(value, String mensaje) {
  if (value!.isEmpty) {
    return mensaje;
  }
  return null;
}

class NewTextFormField extends StatelessWidget {
  const NewTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.context,
    required this.editable,
  });

  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final BuildContext context;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
      child: TextFormField(
        controller: controller,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          enabled: editable,
          labelText: labelText,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        validator: validator,
      ),
    );
  }
}
