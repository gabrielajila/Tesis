import 'package:facturito/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.context,
    required this.maxLength,
    required this.formatters, required this.enabled,
  });

  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final BuildContext context;
  final int maxLength;
  final bool enabled;
  final List<TextInputFormatter> formatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        maxLength: maxLength,
        inputFormatters: formatters,
        controller: controller,
        autofocus: true,
        obscureText: false,
        decoration: customImputDecoration(context, enabled, labelText),
        style: FlutterFlowTheme.of(context).bodyMedium,
        validator: validator,
      ),
    );
  }


}
  InputDecoration customImputDecoration(BuildContext context, bool enabled, String labelText) {
    return InputDecoration(
        enabled: enabled,
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
      );
  }