import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/componentes/actualizar_cliente/actualizar_cliente_widget.dart';
import 'package:facturito/flutter_flow/form_field_controller.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
export 'crear_cliente_model.dart';

class CrearClienteWidget extends StatefulWidget {
  const CrearClienteWidget({Key? key, required this.value}) : super(key: key);
  final String value;
  @override
  _CrearClienteWidgetState createState() => _CrearClienteWidgetState();
}

class _CrearClienteWidgetState extends State<CrearClienteWidget> {
  late AdquirienteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdquirienteModel());

    _model.identificacionTextController ??= TextEditingController();
    _model.razonSocialTextController ??= TextEditingController();
    _model.emailTextController ??= TextEditingController();
    _model.telefonoTextController ??= TextEditingController();
    _model.direccionTextController ??= TextEditingController();
    _model.tipoIdentificacionDropDownValueController ??=
        FormFieldController(null);

    _model.identificacionTextController.text =
        "{widget.cliente.identificacion}";
    _model.razonSocialTextController.text = "{widget.cliente.razonSocial}";
    _model.emailTextController.text = "{widget.cliente.emailAdquiriente}";
    _model.telefonoTextController.text = "{widget.cliente.telefono}";
    _model.direccionTextController.text = "{widget.cliente.direccion}";
    _model.tipoIdentificacionDropDownValueController?.value =
        "{widget.cliente.idTipoIdentificacion.tipoIdentificacion}";
    print('modelo ${_model.tipoIdentificacionDropDownValueController?.value}');
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Center();
  }
}

// class _CrearClienteWidgetState extends State<CrearClienteWidget> {
//   late CrearClienteModel _model;

//   @override
//   void setState(VoidCallback callback) {
//     super.setState(callback);
//     _model.onUpdate();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => CrearClienteModel());

//     _model.cedula ??= TextEditingController();
//     _model.nombre ??= TextEditingController();
//     _model.correo ??= TextEditingController();
//     _model.telefono ??= TextEditingController();
//     _model.direccion ??= TextEditingController();
//     WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
//   }

//   @override
//   void dispose() {
//     _model.maybeDispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     context.watch<FFAppState>();

//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         color: Color(0xB20B191E),
//       ),
//       child: Align(
//         alignment: AlignmentDirectional(0.00, 1.00),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Align(
//                 alignment: AlignmentDirectional(1.00, 0.00),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 16.0),
//                   child: FlutterFlowIconButton(
//                     borderColor: Colors.transparent,
//                     borderRadius: 30.0,
//                     borderWidth: 1.0,
//                     buttonSize: 44.0,
//                     fillColor: Color(0xFFF1F4F8),
//                     icon: Icon(
//                       Icons.close_rounded,
//                       color: Color(0xFF57636C),
//                       size: 24.0,
//                     ),
//                     onPressed: () async {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//               ),
//               Material(
//                 color: Colors.transparent,
//                 elevation: 5.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(0.0),
//                     bottomRight: Radius.circular(0.0),
//                     topLeft: Radius.circular(16.0),
//                     topRight: Radius.circular(16.0),
//                   ),
//                 ),
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Color(0xFF4A70C8),
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(0.0),
//                       bottomRight: Radius.circular(0.0),
//                       topLeft: Radius.circular(16.0),
//                       topRight: Radius.circular(16.0),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                             0.0, 12.0, 0.0, 12.0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                   16.0, 0.0, 0.0, 0.0),
//                               child: Text(
//                                 'Crear Cliente',
//                                 style: FlutterFlowTheme.of(context)
//                                     .headlineSmall
//                                     .override(
//                                       fontFamily: 'Outfit',
//                                       color: const Color.fromARGB(255, 0, 0, 0),
//                                       fontSize: 24.0,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Divider(
//                         height: 4.0,
//                         thickness: 1.0,
//                         color: Color(0xFFE0E3E7),
//                       ),
//                       Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsetsDirectional.fromSTEB(
//                             16.0, 0.0, 16.0, 12.0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Form(
//                               key: _model.formKey,
//                               autovalidateMode: AutovalidateMode.disabled,
//                               child: Container(
//                                 width: 339.0,
//                                 decoration: BoxDecoration(),
//                                 child: Align(
//                                   alignment: AlignmentDirectional(0.00, 0.00),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 10.0, 8.0, 0.0),
//                                         child: TextFormField(
//                                           controller: _model.cedula,
//                                           autofocus: true,
//                                           obscureText: false,
//                                           decoration: InputDecoration(
//                                             labelText: 'Cedula',
//                                             labelStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             hintStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .alternate,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             errorBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedErrorBorder:
//                                                 UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             filled: true,
//                                             fillColor: Colors.white,
//                                           ),
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium,
//                                           validator: _model
//                                               .cedulaController1Validator
//                                               .asValidator(context),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 10.0, 8.0, 0.0),
//                                         child: TextFormField(
//                                           controller: _model.nombre,
//                                           autofocus: true,
//                                           obscureText: false,
//                                           decoration: InputDecoration(
//                                             labelText: 'Nombre Completo',
//                                             labelStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             hintStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .alternate,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             errorBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedErrorBorder:
//                                                 UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             filled: true,
//                                             fillColor: Colors.white,
//                                           ),
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium,
//                                           validator: _model
//                                               .nombreController2Validator
//                                               .asValidator(context),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 10.0, 8.0, 0.0),
//                                         child: TextFormField(
//                                           controller: _model.correo,
//                                           autofocus: true,
//                                           obscureText: false,
//                                           decoration: InputDecoration(
//                                             labelText: 'Correo Electronico',
//                                             labelStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             hintStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .alternate,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             errorBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedErrorBorder:
//                                                 UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             filled: true,
//                                             fillColor: Colors.white,
//                                           ),
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium,
//                                           validator: _model
//                                               .correoController3Validator
//                                               .asValidator(context),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 10.0, 8.0, 0.0),
//                                         child: TextFormField(
//                                           controller: _model.correo,
//                                           autofocus: true,
//                                           obscureText: false,
//                                           decoration: InputDecoration(
//                                             labelText: 'Telefono',
//                                             labelStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             hintStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .alternate,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             errorBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedErrorBorder:
//                                                 UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             filled: true,
//                                             fillColor: Colors.white,
//                                           ),
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium,
//                                           validator: _model
//                                               .telefonoController4Validator
//                                               .asValidator(context),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             8.0, 10.0, 8.0, 0.0),
//                                         child: TextFormField(
//                                           controller: _model.direccion,
//                                           autofocus: true,
//                                           obscureText: false,
//                                           decoration: InputDecoration(
//                                             labelText: 'Direccion',
//                                             labelStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             hintStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .labelMedium,
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .alternate,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .primary,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             errorBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             focusedErrorBorder:
//                                                 UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .error,
//                                                 width: 2.0,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                             ),
//                                             filled: true,
//                                             fillColor: Colors.white,
//                                           ),
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium,
//                                           validator: _model
//                                               .direccionController5Validator
//                                               .asValidator(context),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Divider(
//                         height: 4.0,
//                         thickness: 1.0,
//                         color: Color(0xFFE0E3E7),
//                       ),
//                       Align(
//                         alignment: AlignmentDirectional(0.00, 0.00),
//                         child: FFButtonWidget(
//                           onPressed: () {
//                             Future<ApiCallResponse> saved =
//                                 AdquirienteCall.guarAdquiriente(
//                                     identificacion: _model.cedula.text,
//                                     correo: _model.correo.text,
//                                     direccion: _model.direccion.text,
//                                     nombre: _model.nombre.text,
//                                     telefono: "999999999");
//                             //la linea de arriba es un ejemplo para colocar los datos que me deje ingresar en el formulario
//                             print('Button pressed ...');
//                             saved.then((value) => print("response $value"));
//                           },
//                           text: 'Guardar',
//                           options: FFButtonOptions(
//                             height: 40.0,
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 24.0, 0.0, 24.0, 0.0),
//                             iconPadding: EdgeInsetsDirectional.fromSTEB(
//                                 0.0, 0.0, 0.0, 0.0),
//                             color: FlutterFlowTheme.of(context).alternate,
//                             textStyle: FlutterFlowTheme.of(context)
//                                 .titleSmall
//                                 .override(
//                                   fontFamily: 'Readex Pro',
//                                   color: FlutterFlowTheme.of(context)
//                                       .secondaryText,
//                                 ),
//                             elevation: 3.0,
//                             borderSide: BorderSide(
//                               color: Colors.transparent,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
