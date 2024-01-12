import 'dart:convert';

import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/models/model_resp_simple.dart';
import 'package:facturito/shared/customSnackBar.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF4A70C8),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Container(
                          width: 360.0,
                          height: 164.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF4A70C8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/2-removebg-preview.png',
                              width: 312.0,
                              height: 252.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 481.0,
                      height: 536.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: Form(
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.always,
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 20.0, 8.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Usuario',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 4.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 4.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 4.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 4.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          prefixIcon: Icon(
                                            Icons.person,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.start,
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Form(
                              key: _model.formKey1,
                              autovalidateMode: AutovalidateMode.always,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 20.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController2,
                                  autofocus: true,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Contraseña',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontWeight: FontWeight.w600,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 4.0,
                                      ),
                                      borderRadius: BorderRadius.circular(60.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 4.0,
                                      ),
                                      borderRadius: BorderRadius.circular(60.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 4.0,
                                      ),
                                      borderRadius: BorderRadius.circular(60.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 4.0,
                                      ),
                                      borderRadius: BorderRadius.circular(60.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                    prefixIcon: Icon(
                                      Icons.password_sharp,
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 150.0, 0.0),
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Olvidastes tu contraseña?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  try {
                                    ApiCallResponse login = await Usuario.login(
                                        _model.textController1.text,
                                        _model.textController2.text);

                                    RespSimple responseLogin =
                                        RespSimple.trasformarRespuesta(
                                            login.bodyText);
                                    if (responseLogin.codigo == '0') {
                                      String token = login
                                              .jsonBody['parametroRespuesta'] ??
                                          '';
                                      FFAppState().token = token;
                                      int idCliente =
                                          login.jsonBody['data']['idCliente'];
                                      FFAppState().idCliente = idCliente;
                                      FFAppState().ruc = login.jsonBody['data']
                                          ['identification'];
                                      ApiCallResponse
                                          respuestaEstablecimientos =
                                          await EstablecimientoCall
                                              .obtenerEstablecimientos(
                                                  idCliente:
                                                      FFAppState().idCliente);
                                      int idEstablecimiento =
                                          respuestaEstablecimientos
                                                  .jsonBody['data'][0]
                                              ['idEstablecimiento'];
                                      ApiCallResponse respuestaPuntoEmision =
                                          await PuntoEmisionCall
                                              .obtenerPuntosEmision(
                                                  idEstablecimiento:
                                                      idEstablecimiento);
                                      int idPuntoEmision = respuestaPuntoEmision
                                          .jsonBody['data'][0]['idPuntoVenta'];
                                      FFAppState().idPuntoEmision =
                                          idPuntoEmision.toString();
                                      context.pushNamed('MenuPrincipal');
                                    }
                                    customSnackBar(
                                        context, responseLogin.mensaje);
                                  } catch (e) {
                                    customSnackBar(context,
                                        'Error en el proceso de autenticación');
                                  }
                                },
                                text: 'Ingresar',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF4A70C8),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 14.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(60.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Registrar');
                                },
                                child: RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Aun no tienes cuenta?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'Registrate',
                                        style: TextStyle(
                                          color: Color(0xFF4A70C8),
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFCD7BFB),
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
