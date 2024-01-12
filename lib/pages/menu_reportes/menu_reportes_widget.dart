import 'dart:convert';

import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/models/DTO/ClientesProductosFrecuentesDTO.dart';
import 'package:facturito/models/DTO/DashboardFacturaDTO.dart';
import 'package:facturito/models/model_resp_simple.dart';
import 'package:facturito/pages/menu_reportes/ReportClienteFrecuente.dart';
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
              ButtonFacturasEmitidas(),
              Titulos(titulo: 'GRAFICO DE FACTURAS EMITIDAS'),
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
              Divider(),
              Titulos(titulo: 'TOP 5 CLIENTES FRECUENTES'),
              FutureBuilder(
                future: Dashboard.getClientesFrecuentes(
                    idCliente: FFAppState().idCliente),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final response = snapshot.data;
                    final respSimple =
                        RespSimple.fromJson(json.decode(response.bodyText));
                    if (respSimple.codigo == '0') {
                      List<ClientesFrecuentesDto> listaClientes =
                          clientesFrecuentesDtoFromJson(
                              json.encode(respSimple.data));
                      return ReportClienteFrecuentes(
                          listaClientes: listaClientes);
                    }
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('ERROR'));
                  }
                  return Container();
                },
              ),
              Divider(),

              Titulos(titulo: 'TOP 5 PRODUCTOS MAS VENDIDOS'),
              FutureBuilder(
                future: Dashboard.getProductosFrecuentes(
                    idCliente: FFAppState().idCliente),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final response = snapshot.data;
                    final respSimple =
                        RespSimple.fromJson(json.decode(response.bodyText));
                    if (respSimple.codigo == '0') {
                      List<ClientesFrecuentesDto> listaClientes =
                          clientesFrecuentesDtoFromJson(
                              json.encode(respSimple.data));
                      return ReportClienteFrecuentes(
                          listaClientes: listaClientes);
                    }
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('ERROR'));
                  }
                  return Container();
                },
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonFacturasEmitidas extends StatelessWidget {
  const ButtonFacturasEmitidas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
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
    );
  }
}

class Titulos extends StatelessWidget {
  const Titulos({
    super.key,
    required this.titulo,
  });
  final String titulo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
          width: double.infinity,
          child: Text(titulo,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center)),
    );
  }
}
