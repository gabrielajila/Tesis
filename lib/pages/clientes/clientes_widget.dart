import 'dart:convert';

import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/enviroments.dart';
import 'package:facturito/models/Adquiriente.dart';

import '/componentes/actualizar_cliente/actualizar_cliente_widget.dart';
import '/componentes/crear_cliente/crear_cliente_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cliente.dart';
export '../../models/cliente.dart';

class ClientesWidget extends StatefulWidget {
  const ClientesWidget({Key? key}) : super(key: key);

  @override
  _ClientesWidgetState createState() => _ClientesWidgetState();
}

class _ClientesWidgetState extends State<ClientesWidget> {
  late ClientesValidatorModel _model;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<Adquiriente> clientes = [];
  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => ClientesValidatorModel());
    _model.razonSocial ??= TextEditingController();
    _model.identificacion ??= TextEditingController();
    _model.direccion ??= TextEditingController();
    _model.telefono ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    // response.then((value) {
    //   print('response: ' + value.response!.body);
    //   clientes = adquirienteFromJson(value.response?.body ?? '');
    //   print(clientes[0].emailAdquiriente);
    // });
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
            'Clientes ',
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
          bottom: true,
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: TextFormField(
                            controller: _model.identificacion,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Buscar Cliente',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF57636C),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Enviroments.primaryColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E3E7),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Enviroments.primaryColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF14181B),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            validator: _model.identificacionControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 30.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => FocusScope.of(context)
                                  .requestFocus(_unfocusNode),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ActualizarClienteWidget(
                                    cliente: Adquiriente.nuevo()),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      text: 'Nuevo',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
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
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).alternate,
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Container(
                          width: 468.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 4.0),
                                  child: Text(
                                    'Lista de Clientes',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF4A70C8),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: Color.fromARGB(255, 108, 126, 149),
                                ),
                                getClients(),
                                Divider(
                                  thickness: 1.0,
                                  color: Color.fromARGB(255, 108, 126, 149),
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
      ),
    );
  }

  FutureBuilder<ApiCallResponse> getClients() {
    return FutureBuilder(
      future: AdquirienteCall.obtenerListaAdquirientes(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          clientes = adquirienteFromJson(snapshot.data.response.body);
          return ListView.builder(
            physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: clientes.length,
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                title: Text(
                  '${clientes[i].razonSocial}',
                ),
                subtitle: Text('${clientes[i].identificacion}',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                trailing: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () async {
                    print('{object}');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () =>
                              FocusScope.of(context).requestFocus(_unfocusNode),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: ActualizarClienteWidget(
                              cliente: clientes[i],
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
