import 'dart:convert';

import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/models/DTO/DashboardFacturaDTO.dart';
import 'package:facturito/models/model_resp_simple.dart';
import 'package:facturito/pages/menu_reportes/ReportFacturas.dart';

import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_reportes_model.dart';
export 'menu_reportes_model.dart';

class MenuReportesWidget extends StatefulWidget {
  const MenuReportesWidget({Key? key}) : super(key: key);

  @override
  _MenuReportesWidgetState createState() => _MenuReportesWidgetState();
}

class _MenuReportesWidgetState extends State<MenuReportesWidget> {
  late MenuReportesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuReportesModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF4A70C8),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('MenuPrincipal');
            },
          ),
          title: Text(
            'Reportes',
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
            // mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder(
                future: Dashboard.getFacturasByMonth(
                    idCliente: FFAppState().idCliente),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final response = snapshot.data;
                    final respSimple =
                        RespSimple.fromJson(json.decode(response.bodyText));
                    if (respSimple.codigo == '0') {
                      List<DashboardFacturaDto> listaDataFactura =
                          dashboardFacturaDtoFromJson(
                              json.encode(respSimple.data));
                      List<SalesData> chartData = [];
                      for (var i = 0; i < listaDataFactura.length; i++) {
                        chartData.add(SalesData(listaDataFactura[i].mes,
                            listaDataFactura[i].cantidad));
                      }
                      return ReportFacturas(chartData: chartData);
                    }
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('ERROR'));
                  }
                  return Container();
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          child: ClipRRect(
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('FacturaEmitida');
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.fact_check,
                                        color: Color(0xFF4A70C8),
                                        size: 50.0,
                                      ),
                                      Text(
                                        'Facturas emitidas',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(null),
                          options: ['Febrero', 'Marzo', 'Abril'],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: 300.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: 'Seleccione un mes',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Padding(
                    //   padding:
                    //       EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Flexible(
                    //         child: Align(
                    //           alignment: AlignmentDirectional(-1.00, 0.00),
                    //           child: Padding(
                    //             padding: EdgeInsetsDirectional.fromSTEB(
                    //                 20.0, 20.0, 0.0, 0.0),
                    //             child: Text(
                    //               'Ventas mensuales',
                    //               style: FlutterFlowTheme.of(context)
                    //                   .bodyMedium
                    //                   .override(
                    //                     fontFamily: 'Readex Pro',
                    //                     color: FlutterFlowTheme.of(context)
                    //                         .secondaryText,
                    //                     fontSize: 16.0,
                    //                     fontWeight: FontWeight.w600,
                    //                   ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding:
                    //       EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         width: 331.0,
                    //         height: 146.0,
                    //         decoration: BoxDecoration(
                    //           color: FlutterFlowTheme.of(context)
                    //               .secondaryBackground,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 30.0, 0.0, 0.0),
                                child: Text(
                                  'Clientes frecuentes',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 4.0,
                                    child: Container(
                                      width: 276.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        border: Border.all(
                                          color: Color(0x004B39EF),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '1',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 20.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    '2',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 20.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'cliente 1',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 20.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    'cliente 1',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 20.0,
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 30.0, 0.0, 0.0),
                                child: Text(
                                  'Productos vendidos por mes',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 4.0,
                                    child: Container(
                                      width: 276.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        border: Border.all(
                                          color: Color(0x004B39EF),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '1',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 20.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    '2',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 20.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Producto 1',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 20.0,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Producto 1',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 20.0,
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
