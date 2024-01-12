import 'dart:convert';

import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/models/DTO/FacturaDTO.dart';
import 'package:facturito/pages/compartir_info/compartir_info_widget.dart';
import 'package:facturito/shared/customSnackBar.dart';

import '/componentes/calendario/calendario_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'factura_emitida_model.dart';
export 'factura_emitida_model.dart';

class FacturaEmitidaWidget extends StatefulWidget {
  const FacturaEmitidaWidget({Key? key}) : super(key: key);

  @override
  _FacturaEmitidaWidgetState createState() => _FacturaEmitidaWidgetState();
}

class _FacturaEmitidaWidgetState extends State<FacturaEmitidaWidget> {
  late FacturaEmitidaModel _model;
  late List<FacturaDto> facturas = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FacturaEmitidaModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    GenerarFacturaCall.obtenerUltimas3Facturas(
            idCliente: FFAppState().idCliente)
        .then((value) {
      facturas = facturaDtoFromJson(json.encode(value.jsonBody));
      setState(() {});
    });
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
            'Facturas Emitidas',
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
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.calendarioModel,
                  updateCallback: () => setState(() {}),
                  child: CalendarioWidget(),
                ),
                TextButton(
                    onPressed: () {
                      print(_model.calendarioModel.calendarSelectedDay?.start);
                      DateTime fechaInicio =
                          _model.calendarioModel.calendarSelectedDay?.start ??
                              DateTime.now();
                      DateTime fechaFinal =
                          _model.calendarioModel.calendarSelectedDay?.end ??
                              DateTime.now();
                      GenerarFacturaCall.obtenerFacturasPorFecha(
                              idCliente: FFAppState().idCliente,
                              fechaInicio: fechaInicio,
                              fechaFinal: fechaFinal)
                          .then((value) {
                        facturas =
                            facturaDtoFromJson(json.encode(value.jsonBody));
                        setState(() {});
                      });
                    },
                    child: Container(
                      child: Text('Filtrar'),
                    )),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: facturas.length,
                  itemBuilder: (BuildContext context, int index) {
                    final f = facturas[index];
                    return ItemFactura(
                        fecha: f.fechaEmision,
                        razonSocial: f.razonSocial,
                        valor: f.total,
                        autorizacion: f.authorizacion);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemFactura extends StatelessWidget {
  const ItemFactura({
    super.key,
    required this.valor,
    required this.razonSocial,
    required this.fecha,
    required this.autorizacion,
  });
  final double valor;
  final String razonSocial;
  final DateTime fecha;
  final String autorizacion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          razonSocial,
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            fecha.toIso8601String(),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$$valor',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF364760),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          'Compra',
                          textAlign: TextAlign.end,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: autorizacion == ''
                              ? null
                              : () async {
                                  try {
                                    await showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext bc) {
                                        return CompartirInfoWidget(
                                            numAutorizacion: autorizacion);
                                      },
                                    );
                                  } catch (e) {
                                    customSnackBar(context, 'error');
                                  }
                                },
                          text: '',
                          icon: Icon(
                            Icons.addchart_outlined,
                            color: Color(0xFF4A70C8),
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: 50.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            color: Color(0x004B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: autorizacion != ''
                                ? null
                                : () {
                                    print('Button pressed .d..');
                                  },
                            text: '',
                            icon: Icon(
                              Icons.cancel,
                              color: Color(0xFF4A70C8),
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: 50.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              color: Color(0x004B39EF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent4,
          ),
        ],
      ),
    );
  }
}
