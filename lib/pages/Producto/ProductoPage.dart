import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/componentes/actualizar_producto/producto_form_widget.dart';
import 'package:facturito/models/Producto.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProductoPageModel.dart';
export 'ProductoPageModel.dart';

class ProductoPage extends StatefulWidget {
  const ProductoPage({Key? key}) : super(key: key);

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  late ProductoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Producto> productos = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductoPageModel());

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
            'Productos y Servicios',
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
            physics: NeverScrollableScrollPhysics(),
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
                          controller: _model.textController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Buscar Producto',
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
                                  color: Color(0xFF65A0CE),
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
                                color: Color(0xFF4B39EF),
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF14181B),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          validator: _model.textControllerValidator
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
                              child: ProductoFormWidget(
                                  producto: Producto.empty()),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    text: 'Nuevo',
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 4.0),
                      child: Text(
                        'Lista de Productos',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                    FutureBuilder(
                      future: ProductoApiCall.obtenerListaProductos(
                          FFAppState().idCliente),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          productos =
                              productoFromJson(snapshot.data.response.body);
                          return ListView.builder(
                            // physics: ScrollPhysics(
                            //     parent:
                            //         NeverScrollableScrollPhysics()),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: productos.length,
                            itemBuilder: (BuildContext context, int i) {
                              return ListTile(
                                title: Text(
                                  '${productos[i].nombreProducto}',
                                ),
                                subtitle: Text('${productos[i].codigo}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                trailing: IconButton(
                                  icon: Icon(Icons.menu),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        // return Text('data');
                                        return GestureDetector(
                                          onTap: () => null,
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ProductoFormWidget(
                                              producto: productos[i],
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
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Color(0xFFE0E3E7),
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
