import 'package:facturito/pages/facturar/factura.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'facturar_model.dart';
export 'facturar_model.dart';

class FacturarWidget extends StatefulWidget {
  const FacturarWidget({Key? key}) : super(key: key);

  @override
  _FacturarWidgetState createState() => _FacturarWidgetState();
}

class _FacturarWidgetState extends State<FacturarWidget> {
  late FacturarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FacturarModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
    _model.textController5 ??= TextEditingController();
    _model.textController6 ??= TextEditingController();
    _model.txtMontoController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF4A70C8),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Facturar',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 5.0,
                        child: ClipRRect(
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.valorQR =
                                    await FlutterBarcodeScanner.scanBarcode(
                                  '#C62828', // scanning line color
                                  'Cancel', // cancel button text
                                  true, // whether to show the flash icon
                                  ScanMode.QR,
                                );

                                setState(() {
                                  FFAppState().qr = _model.valorQR!;
                                });
                                if (FFAppState().qr != null &&
                                    FFAppState().qr != '') {
                                  await actions.getDataQR(
                                    FFAppState().qr,
                                  );

                                  context.pushNamed('Facturar');
                                } else {
                                  setState(() {
                                    _model.textController6?.clear();
                                    _model.textController5?.clear();
                                    _model.textController4?.clear();
                                    _model.textController3?.clear();
                                    _model.textController2?.clear();
                                    _model.textController1?.clear();
                                    _model.txtMontoController?.clear();
                                  });
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Atención'),
                                        content:
                                            Text('Los datos no se encuentran'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }

                                setState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.qr_code,
                                    color: Color(0xFF4A70C8),
                                    size: 50.0,
                                  ),
                                  Text(
                                    'Scan',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('FactProducto');
                    },
                    text: 'Seleccionar Producto/Servicio',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF4A70C8),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController1,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Nombres y Apellidos',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController2,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Identificacion',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController3,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Telefono',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController3Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController4,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController4Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 20.0, 40.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController5,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Descuento',
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController5Validator
                            .asValidator(context),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(6.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 20.0, 40.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController6,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Direccion',
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController6Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.95, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 12.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  child: TextFormField(
                                    controller: _model.txtMontoController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'MONTO :',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF95A1AC),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF1F4F8),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 0.0, 24.0),
                                      prefixIcon: Icon(
                                        Icons.attach_money,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF4D0000),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                    maxLines: null,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: true, decimal: true),
                                    validator: _model
                                        .txtMontoControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  context.pushNamed('factura');
                                },
                                text: 'Facturar',
                                icon: Icon(
                                  Icons.receipt_long_rounded,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF4A70C8),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
