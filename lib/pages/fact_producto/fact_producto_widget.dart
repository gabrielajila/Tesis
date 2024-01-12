import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fact_producto_model.dart';
export 'fact_producto_model.dart';

class FactProductoWidget extends StatefulWidget {
  const FactProductoWidget({Key? key}) : super(key: key);

  @override
  _FactProductoWidgetState createState() => _FactProductoWidgetState();
}

class _FactProductoWidgetState extends State<FactProductoWidget> {
  late FactProductoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FactProductoModel());

    _model.textController ??= TextEditingController();
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                                      'Lista de Productos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: Color(0xFFE0E3E7),
                                  ),
                                  ListView.builder(
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text('items[index]'),
                                      );
                                    },
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: Color(0xFFE0E3E7),
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
              Align(
                alignment: AlignmentDirectional(1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 30.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Atención'),
                            content: Text('Se guardaron los cambios'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: 'Agregar',
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 4.0),
                          child: Text(
                            'Producto agregado',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
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
                          color: Color(0xFFE0E3E7),
                        ),
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            MouseRegion(
                              opaque: false,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: _model.iuserHovered3!
                                      ? Color(0xFFF1F4F8)
                                      : Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 8.0, 12.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nombre:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Text(
                                                'Cantidad:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Text(
                                                'Subtotal:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Text(
                                                'IVA:',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Color(0x004B39EF),
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0x004B39EF),
                                        icon: Icon(
                                          Icons.replay_rounded,
                                          color: Color(0xFF4A70C8),
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode),
                                                // child: Padding(
                                                //   padding:
                                                //       MediaQuery.viewInsetsOf(
                                                //           context),
                                                //   child:
                                                //      // ActualizarClienteWidget(),
                                                // ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Color(0x004B39EF),
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: Color(0x004B39EF),
                                        icon: Icon(
                                          Icons.delete,
                                          color: Color(0xFF4A70C8),
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode),
                                                // child: Padding(
                                                //   padding:
                                                //       MediaQuery.viewInsetsOf(
                                                //           context),
                                                //   child:
                                                //       ActualizarClienteWidget(),
                                                // ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onEnter: ((event) async {
                                setState(() => _model.iuserHovered3 = true);
                              }),
                              onExit: ((event) async {
                                setState(() => _model.iuserHovered3 = false);
                              }),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1.0,
                          color: Color(0xFFE0E3E7),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 30.0, 0.0),
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
                                .requestFocus(_model.unfocusNode),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Text('data'),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    text: 'Agregar a Factura',
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
            ],
          ),
        ),
      ),
    );
  }
}
