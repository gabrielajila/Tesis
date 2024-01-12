import 'dart:async';

import 'package:facturito/componentes/actualizar_producto/producto_form_widget.dart';
import 'package:facturito/index.dart';
import 'package:facturito/models/model_productos.dart';
import 'package:facturito/models/productoAux.dart';
import 'package:facturito/pages/facturar/generarFacturaModel.dart';
import 'package:facturito/shared/customSnackBar.dart';
import 'package:facturito/shared/input.dart';
import 'package:flutter/services.dart';
import 'package:xml/xpath.dart';

import '../../componentes/p_d_f_fact/p_d_f_fact_widget.dart';
import '../../models/TipoIdentificacion.model.dart';
import '../../models/model_resp_simple.dart';
import '../../shared/decodeUTF8.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:xml/xml.dart';

class GenerafacturaWidget extends StatefulWidget {
  const GenerafacturaWidget({Key? key}) : super(key: key);

  @override
  _GenerafacturaWidgetState createState() => _GenerafacturaWidgetState();
}

class _GenerafacturaWidgetState extends State<GenerafacturaWidget>
    with SingleTickerProviderStateMixin {
  late GenerafacturaModel _model;
  late Future<String> respuestaListaTipoIdentificacion;
  late double monto1;
  late double monto2;
  late int descuento;
  TabController? _tabController;
  FocusNode _focusNode = FocusNode();
  late double montoT;
  final TextInputFormatter _digitFormatter =
      FilteringTextInputFormatter.digitsOnly;
  late double precioMonto;
  late double valorIVA;
  late int numeroProductos;
  bool txtActivoConsumidorFinal = true;
  late Future<String> respuestaListaProductos;
  late List<dynamic> lista;
  late List<dynamic> listaAux;
  late List<Producto> listaObjetosProductos;
  late List<int> listaIds;
  late int idProducto;
  String _errorText = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<ProductoAux> vectorObjetos;
  bool cargando2 = true;
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerafacturaModel());
    _tabController = TabController(length: 2, vsync: this);
    _model.txtIdentificacionController ??= TextEditingController();
    _model.txtNombresController ??= TextEditingController();
    _model.txtTelefonoController ??= TextEditingController();
    _model.txtEmailController ??= TextEditingController();
    _model.txtDireccionController ??= TextEditingController();
    _model.txtMontoController ??= TextEditingController();
    _model.txtImpuestosController ??= TextEditingController();
    _model.txtEmailController2 ??= TextEditingController();
    _model.txtDescuentoController ??= TextEditingController();
    _model.txtObservacionesController ??= TextEditingController();
    _model.txtPrecioUnitarioController ??= TextEditingController();
    _model.txtCantidadController ??= TextEditingController();
    idProducto = 0;
    listaObjetosProductos = [];
    listaIds = [];
    vectorObjetos = [];

    respuestaListaProductos = ProductosCall.obtenerListaProductos(
            idCliente: FFAppState().idCliente, idProducto: '0')
        .then((value) {
      setState(() {
        cargando2 = false;
        lista = jsonDecode(value.bodyText);
      });
      return value.bodyText;
    });
    setState(() {
      txtActivoConsumidorFinal = true;
      descuento = 0;
      monto1 = 0;
      monto2 = 0;
      montoT = 0;
      precioMonto = 0;
      valorIVA = 0;
      lista = jsonDecode('[]');
      listaAux = jsonDecode('[]');
      respuestaListaTipoIdentificacion =
          GenerarFacturaCall.obtenerListaTipoIdentificacion().then((value) {
        return value.bodyText;
      });
      _model.txtDescuentoController.text = descuento.toString();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _focusTextField() {
    FocusScope.of(context).requestFocus(_focusNode);
  }

  void _onTextFieldChanged(String value) {
    _model.cmbIdentificacionValueController?.reset();

    if (_model.cmbIdentificacionValue != "07" &&
        _model.txtIdentificacionController.text == "9999999999999") {
      setState(() {
        txtActivoConsumidorFinal = true;
        _model.txtIdentificacionController?.clear();
        _model.txtNombresController?.clear();
        _model.txtTelefonoController?.clear();
        _model.txtEmailController?.clear();
        _model.txtDireccionController?.clear();
        _model.txtMontoController?.clear();
        _model.txtImpuestosController?.clear();
        _model.cmbIdentificacionValueController?.reset();
      });
    }
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(Duration(milliseconds: 500), () async {
      // Esta es la función que se ejecutará automáticamente después de 500 ms de inactividad en el TextField
      if (_model.txtIdentificacionController.text != null &&
          _model.txtIdentificacionController.text != '') {
        _model.respuestaAdquiriente =
            await GenerarFacturaCall.buscarAdquiriente(
          identificacion: _model.txtIdentificacionController.text,
        );
        final adquiriente =
            json.encode(_model.respuestaAdquiriente?.jsonBody['data']);
        if (GenerarFacturaCall.razonSocial(
              (json.decode(adquiriente) ?? ''),
            ).toString() !=
            GenerarFacturaCall.identification(
              (json.decode(adquiriente) ?? ''),
            ).toString()) {
          FFAppState().update(() {
            FFAppState().razonSocialA = GenerarFacturaCall.razonSocial(
              (json.decode(adquiriente) ?? ''),
            ).toString();
            FFAppState().identificacionA = GenerarFacturaCall.identification(
              (json.decode(adquiriente) ?? ''),
            ).toString();
            FFAppState().direccionA = GenerarFacturaCall.direccion(
              (json.decode(adquiriente) ?? ''),
            ).toString();
            FFAppState().telefonoA = GenerarFacturaCall.telefono(
              (json.decode(adquiriente) ?? ''),
            ).toString();
            FFAppState().correoA = GenerarFacturaCall.emailAdquiriente(
              (json.decode(adquiriente) ?? ''),
            ).toString();
            FFAppState().descuentoA = GenerarFacturaCall.descuentoAdquiriente(
              (json.decode(adquiriente) ?? ''),
            ).toString();
            FFAppState().tipoIdentificacionA =
                GenerarFacturaCall.tipoIdentificacionAdquiriente(
              (json.decode(adquiriente) ?? ''),
            ).toString();
          });

          if (FFAppState().identificacionA == "9999999999999") {
            setState(() {
              txtActivoConsumidorFinal = false;
            });
          }
          _model.txtNombresController.text = FFAppState().razonSocialA;
          _model.txtTelefonoController.text = FFAppState().telefonoA;
          _model.txtEmailController.text = FFAppState().correoA;
          _model.txtDireccionController.text = FFAppState().direccionA;
          _model.txtDescuentoController.text = FFAppState().descuentoA;
          _model.cmbIdentificacionValueController?.value =
              FFAppState().tipoIdentificacionA;
        } else {
          setState(() {
            txtActivoConsumidorFinal = true;
            _model.txtNombresController?.clear();
            _model.txtTelefonoController?.clear();
            _model.txtEmailController?.clear();
            _model.txtDireccionController?.clear();
            _model.txtDescuentoController.text = "0";
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'No se econtró resultados con la identificación',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF57636C),
                    ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: Color.fromARGB(255, 252, 252, 252),
            ),
          );
        }
      } else {
        setState(() {
          txtActivoConsumidorFinal = true;
          _model.txtNombresController?.clear();
          _model.txtTelefonoController?.clear();
          _model.txtEmailController?.clear();
          _model.txtDireccionController?.clear();
          _model.txtDescuentoController.text = "0";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ingrese identificación',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFF57636C),
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: Color.fromARGB(255, 252, 252, 252),
          ),
        );
      }
    });
  }

  String obtenerElemento(XmlDocument document, String etiqueta) {
    return document.xpath(etiqueta).single.innerText;
  }

  bool _isValidEmail(String email) {
    RegExp emailRegExp = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegExp.hasMatch(email);
  }

  Future<double> montoTotal(String precio, String iva, String descuento) async {
    ApiCallResponse respuesta = await ProductosCall.obtenerMontoProducto(
        precio: double.parse(precio),
        iva: double.parse(iva),
        descuento: double.parse(descuento));
    return double.parse(respuesta.bodyText);
  }

  bool _isValidCedula(String input) {
    // Implementa la validación de cédula ecuatoriana con una expresión regular
    // Por ejemplo:
    return RegExp(r'^\d{10}$').hasMatch(input);
  }

  bool _isValidRUC(String input) {
    // Implementa la validación de RUC con una expresión regular
    // Por ejemplo:
    return RegExp(r'^\d{13}$').hasMatch(input);
  }

  bool _isValidPasaporte(String input) {
    // Implementa la validación de pasaporte con una expresión regular
    // Por ejemplo:
    return RegExp(r'^[A-Z]\d{6}[A-Z0-9]$').hasMatch(input);
  }

  void cambiarPestana(int index) {
    _tabController
        ?.animateTo(index); // Cambia a la pestaña con el índice especificado
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    Widget mostrar;
    Widget cargandoW = MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            color: Color(0xFF57636C),
          ),
        ),
      ),
    );
    Widget sinDatos = Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF4A70C8),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/app_launcher_icon.png',
                width: 92,
                height: 50,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Generar Factura',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Primero debe agregar un producto',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: Color(0xFF57636C),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Widget completo = Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF4A70C8),
        automaticallyImplyLeading: false,
        title: Text('Generar Factura'),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(children: [
            Align(
              alignment: Alignment(0, 0),
              child: TabBar(
                onTap: (_) {},
                isScrollable: false,
                controller: _tabController,
                labelColor: Color(0xFF4A70C8),
                labelPadding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF4A70C8),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                indicatorColor: Color(0xFF4A70C8),
                tabs: [
                  Tab(
                    text: 'Datos Comprador',
                  ),
                  Tab(
                    text: 'Lista Productos',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  TabComprador(context),
                  TabFacturaProducto(context),
                ],
              ),
            ),
          ]),
        ),
      ),
    );

    if (cargando2 == true) {
      mostrar = cargandoW;
    } else {
      if (lista.length > 0) {
        mostrar = completo;
      } else {
        mostrar = sinDatos;
      }
    }

    return mostrar;
  }

  SingleChildScrollView TabFacturaProducto(BuildContext context) {
    List<ProductoModel> productosList = [];
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 10, 20.0, 16.0),
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ&.\s]*$'))
            ],
            readOnly: true,
            maxLength: 300,
            maxLengthEnforcement: MaxLengthEnforcement.none,
            controller: _model.txtNombresController,
            obscureText: false,
            enabled: txtActivoConsumidorFinal,
            decoration: customImputDecoration(context, txtActivoConsumidorFinal, 'Nombres y apellidos*'),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF090F13),
                  fontWeight: FontWeight.normal,
                ),
            textAlign: TextAlign.start,
            validator:
                _model.txtNombresControllerValidator.asValidator(context),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0, 20.0, 16.0),
                  child: FutureBuilder<String>(
                    future: respuestaListaProductos,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<String> snapshot,
                    ) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return FlutterFlowDropDown<String>(
                          controller: _model.cmbProductoValueController ??=
                              FormFieldController<String>(
                            _model.cmbProductoValue ??= '',
                          ),
                          options: ["Cargando..."],
                          onChanged: (val) =>
                              setState(() => _model.cmbProductoValue = val),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF101213),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                          hintText: 'Seleccionar Producto',
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: Color(0xFF57636C),
                            size: 22,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Color(0xFF57636C),
                          borderWidth: 1,
                          borderRadius: 8,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                          isSearchable: false,
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Text('Error');
                        } else if (snapshot.hasData) {
                          productosList = List<ProductoModel>.from(json
                              .decode(snapshot.data!)
                              .map((data) => ProductoModel.fromJson(data)));
                          return FlutterFlowDropDown<String>(
                            controller: _model.cmbProductoValueController ??=
                                FormFieldController<String>(
                              _model.cmbProductoValue ??= '',
                            ),
                            options: List<String>.from(json
                                .decode(snapshot.data!)
                                .map((data) => utf8
                                    .decode(ProductoModel.fromJson(data)
                                        .codigo
                                        .codeUnits)
                                    .toString())),
                            optionLabels: List<String>.from(
                              json.decode(snapshot.data!).map(
                                    (data) =>
                                        "Código: " +
                                        utf8
                                            .decode(ProductoModel.fromJson(data)
                                                .codigo
                                                .codeUnits)
                                            .toString() +
                                        " / Nombre: " +
                                        utf8
                                            .decode(ProductoModel.fromJson(data)
                                                .nombreProducto
                                                .codeUnits)
                                            .toString(),
                                  ),
                            ),
                            onChanged: (val) async {
                              ProductoModel product =
                                  _findProductByCode('$val', productosList);
                              if (product.id == 0) {
                                customSnackBar(
                                    context, 'No existe el producto buscado');
                              }
                            },
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF101213),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: 'Seleccionar Producto',
                            icon:
                                scanProductByCodeMethod(productosList, context),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Color(0xFF57636C),
                            borderWidth: 1,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                            isSearchable: false,
                          );
                        } else {
                          return const Text('Sin Información');
                        }
                      } else {
                        return Text('State: ${snapshot.connectionState}');
                      }
                    },
                  )),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
          child: TextFormField(
            controller: _model.txtPrecioUnitarioController,
            obscureText: false,
            focusNode: _focusNode,
            decoration: customImputDecoration(context, true, 'Precio unitario SIN IVA*'),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF101213),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
            inputFormatters: [_digitFormatter],
            maxLength: 50,
            onChanged: (value) {
              // Se asegura de que el formato se aplique mientras el usuario aún está editando
              final text = _model.txtPrecioUnitarioController.text;
              if (text.length >= 2) {
                final formattedText = '${text.substring(0, text.length - 2)}.'
                    '${text.substring(text.length - 2)}';
                _model.txtPrecioUnitarioController?.value =
                    _model.txtPrecioUnitarioController!.value.copyWith(
                  text: formattedText,
                  selection: TextSelection.collapsed(
                    offset: formattedText.length,
                  ),
                );
              }
            },
            onTap: () {
              _model.txtPrecioUnitarioController?.selection = TextSelection(
                baseOffset: 0,
                extentOffset: _model.txtPrecioUnitarioController.text.length,
              );
            },
            maxLines: null,
            keyboardType: TextInputType.number,
            validator: _model.txtPrecioUnitarioControllerValidator
                .asValidator(context),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: TextFormField(
            controller: _model.txtCantidadController,
            obscureText: false,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'^(\d+)?([.]?\d{0,1})?$')),
            ],
            decoration: customImputDecoration(context, true, 'Cantidad*'),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF101213),
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
            maxLines: null,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            validator:
                _model.txtCantidadControllerValidator.asValidator(context),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.05),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
            child: FFButtonWidget(
              onPressed: () async {
                if (_model.cmbProductoValue == null) {
                  mensajeError(context, "Debe seleccionar un producto");
                } else if (_model.txtPrecioUnitarioController.text.isEmpty) {
                  mensajeError(context, "Precio no ingresado");
                } else if (_model.txtPrecioUnitarioController.text
                        .startsWith('.') ||
                    double.parse(_model.txtPrecioUnitarioController.text) ==
                        0) {
                  mensajeError(context,
                      "El Precio no puede contener un punto al inicio o ser 0");
                } else if (_model.txtCantidadController.text.isEmpty) {
                  mensajeError(context, "Cantidad no ingresada");
                } else {
                  ApiCallResponse codigoProducto,
                      nombreProducto,
                      idIvaProducto,
                      ivaProducto;
                  codigoProducto =
                      await ProductosCall.obtenerCodigoProducto(idProducto);
                  nombreProducto =
                      await ProductosCall.obtenerNombreProducto(idProducto);
                  ivaProducto =
                      await ProductosCall.obtenerIvaProducto(idProducto);
                  idIvaProducto = await ProductosCall.obtenerIdIva(idProducto);
                  setState(() {
                    listaObjetosProductos.add(new Producto(
                        idProducto,
                        listaObjetosProductos.length + 1,
                        codigoProducto.bodyText,
                        DecodeUTF8.decodeString(nombreProducto),
                        double.parse(_model.txtCantidadController.text),
                        double.parse(_model.txtPrecioUnitarioController.text),
                        int.parse(idIvaProducto.bodyText),
                        int.parse(ivaProducto.bodyText),
                        productosWidget(
                            context,
                            idProducto,
                            listaObjetosProductos.length + 1,
                            DecodeUTF8.decodeString(nombreProducto),
                            double.parse(_model.txtCantidadController.text),
                            (double.parse(_model
                                        .txtPrecioUnitarioController.text) *
                                    double.parse(
                                        _model.txtCantidadController.text))
                                .toStringAsFixed(2),
                            int.parse(ivaProducto.bodyText))));
                    setState(() {
                      precioMonto = 0;
                      valorIVA = 0;
                    });
                    for (var element in listaObjetosProductos) {
                      double precio =
                          element.valor + element.valor * (element.iva / 100);
                      precioMonto +=
                          ((precio) - ((precio) * (descuento / 100))) *
                              element.cantidad;
                      valorIVA += precioMonto * (element.iva / 100);
                    }
                    setState(() {
                      _model.txtMontoController.text =
                          precioMonto.toStringAsFixed(2);

                      _model.txtImpuestosController.text =
                          valorIVA.toStringAsFixed(2);
                    });

                    _model.txtCantidadController.text = "";
                    _model.txtPrecioUnitarioController.text = "";
                    listaIds.add(idProducto);
                    respuestaListaProductos =
                        ProductosCall.obtenerListaProductos(
                                idCliente: FFAppState().idCliente,
                                idProducto: listaIds.join(','))
                            .then((value) {
                      setState(() {
                        listaAux = jsonDecode(value.bodyText);
                      });
                      return value.bodyText;
                    });
                  });
                }
              },
              text: 'Agregar Producto',
              options: FFButtonOptions(
                width: 270.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFF4A70C8),
                textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.black87,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: listaObjetosProductos.length != 0
                            ? listaObjetosProductos
                                .map((e) => e.productoW)
                                .divide(SizedBox(height: 5.0))
                            : [
                                Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Sin productos ingresados")
                                    ])
                              ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.95, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 20, 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          int? number = int.tryParse(value);
                          if (number != null && number > 0) {
                            // Valid positive number
                            // Do something with the number
                          } else {
                            // Invalid input, clear the text
                            _model.txtMontoController?.clear();
                            _model.txtImpuestosController?.clear();
                          }
                        }
                      },
                      readOnly: true,
                      controller: _model.txtMontoController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        labelText: 'Monto Total',
                        hintText: 'MONTO',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF95A1AC),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF0A101F),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF841010),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF841010),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                        suffixIcon: Icon(
                          Icons.attach_money,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF4D0000),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                          ),
                      maxLines: null,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      validator: _model.txtMontoControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                child: FFButtonWidget(
                  onPressed: () async {
                    try {
                      if (_model.txtIdentificacionController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'La identificación del comprador debe ser ingresada',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (_model
                                  .txtIdentificacionController.text.length !=
                              10 &&
                          _model.txtIdentificacionController.text.length !=
                              13) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'La Identififacion del Comprador debe contener 10 o 13 caracteres',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (_model.txtNombresController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'El Nombre y Apellido debe ser ingresado',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (_model.txtTelefonoController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'El Teléfono debe ser ingresado',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (_model.txtEmailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'El Correo Electronico debe ser ingresado',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (_model.txtDireccionController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'La Dirección debe ser ingresada',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (_model.txtMontoController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'El Monto debe ser ingresado',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (_model.txtDescuentoController.text.isEmpty ||
                          double.parse(_model.txtDescuentoController.text) <
                              0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'El Descuento no puede estar en blanco o ser 0',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (_model.cmbIdentificacionValue!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'El Tipo de identificación debe ser seleccionado',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (listaObjetosProductos.length == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Debe Agregar Productos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else if (_model.txtIdentificacionController.text ==
                              '9999999999999' &&
                          double.parse(_model.txtMontoController.text) >= 50) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              r'El comprador es un Consumidor Final solo puede facturar un limite de 50$',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      } else {
                        ApiCallResponse respuestaUsuario, factura;
                        String ruc, jsonProductos;
                        respuestaUsuario =
                            await Usuario.buscarIdentificacionUsuario(
                                usuario: FFAppState().user.toString());
                        ruc = respuestaUsuario.bodyText;
                        jsonProductos = jsonEncode(listaObjetosProductos
                            .map((e) => e.toJson())
                            .toList());
                        factura = await GenerarFacturaCall.facturar(
                            ruc: FFAppState().ruc,
                            numComprobante: "",
                            identificacionComprador:
                                _model.txtIdentificacionController.text,
                            razonSocialComprador:
                                _model.txtNombresController.text,
                            direccionComprador:
                                _model.txtDireccionController.text,
                            descuentoComprador: descuento,
                            observaciones:
                                _model.txtObservacionesController.text,
                            telefonoComprador:
                                _model.txtTelefonoController.text,
                            codigoIdentificacion: _model.cmbIdentificacionValue,
                            emailComprador: _model.txtEmailController.text,
                            idPuntoEmision: FFAppState().idPuntoEmision,
                            lstDetalle: jsonProductos);

                        RespSimple respSimple = RespSimple.trasformarRespuesta(
                            factura.response?.body ?? '');

                        FFAppState().update(() {
                          FFAppState().numeroAutorizacion =
                              GenerarFacturaCall.numeroAutorizacion(
                            (factura.jsonBody ?? ''),
                          ).toString();
                        });
                        if (respSimple.codigo == '0') {
                          if (FFAppState().numeroAutorizacion != "null") {
                            ApiCallResponse respuestaPDF =
                                await GenerarFacturaCall.generarFacturaPDF(
                                        numeroAutorizacion:
                                            FFAppState().numeroAutorizacion)
                                    .timeout(Duration(seconds: 10));
                            FFAppState().update(() {
                              FFAppState().pathBytes =
                                  respuestaPDF.response!.bodyBytes;
                            });
                            String? comprobante =
                                GenerarFacturaCall.comprobante(
                              (factura.jsonBody ?? ''),
                            ).toString();

                            final document = XmlDocument.parse(comprobante);

                            String fechaEmisionFactura = obtenerElemento(
                                document, "/factura/infoFactura/fechaEmision");

                            double total = double.parse(obtenerElemento(
                                document,
                                "/factura/infoFactura/pagos/pago/total"));
                            //========= CORRREO ========
                            await GenerarFacturaCall
                                .enviarFacturaByAutorizacion(
                                    correoAdquiriente:
                                        _model.txtEmailController.text,
                                    numAutorizacion:
                                        FFAppState().numeroAutorizacion);
                          }
                          await showDialog<bool>(
                            barrierDismissible: false,
                            context: context,
                            builder: (alertDialogContext) {
                              return WillPopScope(
                                onWillPop: () async {
                                  // Impide que se retroceda físicamente
                                  return false;
                                },
                                child: AlertDialog(
                                  title: null,
                                  content:
                                      FFAppState().numeroAutorizacion != "null"
                                          ? Text('Elija una opción')
                                          : Text('${respSimple.mensaje}'),
                                  actions: [
                                    FFAppState().numeroAutorizacion != "null"
                                        ? TextButton(
                                            onPressed: () async {
                                              await showDialog<bool>(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      'Enviar a Correo Electrónico',
                                                    ),
                                                    content: TextFormField(
                                                      controller: _model
                                                          .txtEmailController2,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .singleLineFormatter,
                                                        FilteringTextInputFormatter
                                                            .deny(RegExp(
                                                                '[^a-zA-Z0-9@._-]')),
                                                      ],
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        labelText: 'Email*',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF95A1AC),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF0A101F),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF841010),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF841010),
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    24, 20, 24),
                                                        suffixIcon: Icon(
                                                          Icons.mail,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22,
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .txtEmailController2Validator
                                                          .asValidator(context),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () async {
                                                            if (!_isValidEmail(
                                                                _model
                                                                    .txtEmailController2
                                                                    .text)) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'El Correo electrónico no es valido',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                        ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      Color.fromARGB(
                                                                          255,
                                                                          252,
                                                                          252,
                                                                          252),
                                                                ),
                                                              );
                                                            } else if (_model
                                                                    .txtEmailController2
                                                                    .text ==
                                                                "") {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'El Correo electrónico debe ser agregado',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                        ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      Color.fromARGB(
                                                                          255,
                                                                          252,
                                                                          252,
                                                                          252),
                                                                ),
                                                              );
                                                            } else {
                                                              try {
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false);
                                                                await GenerarFacturaCall.enviarFacturaByAutorizacion(
                                                                    numAutorizacion:
                                                                        FFAppState()
                                                                            .numeroAutorizacion,
                                                                    correoAdquiriente: _model
                                                                        .txtEmailController2
                                                                        .text);
                                                              } catch (e) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Error al enviar el Correo Electronico a ' +
                                                                          _model
                                                                              .txtEmailController2
                                                                              .text,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                          ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        Color.fromARGB(
                                                                            255,
                                                                            252,
                                                                            252,
                                                                            252),
                                                                  ),
                                                                );
                                                              }
                                                            }
                                                          },
                                                          child: Text(
                                                            'Enviar Correo',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                ),
                                                          )),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text(
                                                          'Salir',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text(
                                              'Reenviar a Correo Electrónico',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                      ),
                                            ),
                                          )
                                        : Text(""),
                                    FFAppState().numeroAutorizacion != "null"
                                        ? TextButton(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PDFviewWidget(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Ver PDF',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                      ),
                                            ),
                                          )
                                        : Text(""),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MenuPrincipalWidget(),
                                        ),
                                      ),
                                      child: Text(
                                        'Aceptar',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${respSimple.mensaje}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF57636C),
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  Color.fromARGB(255, 252, 252, 252),
                            ),
                          );
                        }
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Error al generar factura / Revise los datos ingresados',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFF57636C),
                                ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color.fromARGB(255, 252, 252, 252),
                        ),
                      );
                    }
                  },
                  text: 'Facturar',
                  icon: Icon(
                    Icons.receipt_long_rounded,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    height: 60,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF4A70C8),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  IconButton scanProductByCodeMethod(
      List<ProductoModel> productosList, BuildContext context) {
    return IconButton(
        color: Color(0xFF4A70C8),
        onPressed: () async {
          String value = await FlutterBarcodeScanner.scanBarcode(
              '#C62828', 'Cancelar', true, ScanMode.BARCODE);
          if (value != '-1') {
            _findProductByCode(value, productosList);
            _model.cmbProductoValueController!.value = value;
            setState(() {});
          }
        },
        icon: Icon(Icons.barcode_reader));
  }

  SingleChildScrollView TabComprador(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 10.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      try {
                        _model.qrCodeResp =
                            await FlutterBarcodeScanner.scanBarcode(
                          '#C62828', // scanning line color
                          'Cancel', // cancel button text
                          true, // whether to show the flash icon
                          ScanMode.QR,
                        );
                        FFAppState().update(() {
                          FFAppState().codeQr = _model.qrCodeResp;
                        });
                        if (FFAppState().codeQr != null &&
                            FFAppState().codeQr != '') {
                          await actions.getDataQR(
                            FFAppState().codeQr,
                          );
                          _model.txtIdentificacionController.text =
                              FFAppState().identificacionA;
                          _model.txtNombresController.text =
                              FFAppState().razonSocialA;
                          _model.txtTelefonoController.text =
                              FFAppState().telefonoA;
                          _model.txtEmailController.text = FFAppState().correoA;
                          _model.txtDireccionController.text =
                              FFAppState().direccionA;
                          _model.txtDescuentoController.text =
                              FFAppState().descuentoA;
                          _model.cmbIdentificacionValueController?.value =
                              FFAppState().tipoIdentificacionA;
                        } else {
                          setState(() {
                            _model.txtIdentificacionController?.clear();
                            _model.txtNombresController?.clear();
                            _model.txtTelefonoController?.clear();
                            _model.txtEmailController?.clear();
                            _model.txtDireccionController?.clear();
                            _model.txtMontoController?.clear();
                            _model.txtImpuestosController?.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'No se encontró datos',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF57636C),
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  Color.fromARGB(255, 252, 252, 252),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'No se encontró datos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                  ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color.fromARGB(255, 252, 252, 252),
                          ),
                        );
                      }
                    },
                    text: 'Escanear QR',
                    icon: Icon(
                      Icons.qr_code,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color:Color(0xFF4A70C8),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 1.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
            child: TextFormField(
              maxLength: 13,
              controller: _model.txtIdentificacionController,
              onChanged: (value) {
                _onTextFieldChanged(value);
                String input = value.trim();
                if (input.isNotEmpty) {
                  if (_isValidCedula(input) ||
                      _isValidRUC(input) ||
                      _isValidPasaporte(input)) {
                    setState(() {
                      _errorText =
                          ''; // Limpiar el mensaje de error cuando el documento sea válido
                    });
                  } else {
                    setState(() {
                      _errorText = 'Identificacion inválida';
                    });
                  }
                } else {
                  setState(() {
                    _errorText = '';
                  });
                }
              },
              obscureText: false,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: customImputDecoration(context, true, 'Identificación*'),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF090F13),
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              validator: _model.txtIdentificacionControllerValidator
                  .asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
            child: FutureBuilder<String>(
              future: respuestaListaTipoIdentificacion,
              builder: (
                BuildContext context,
                AsyncSnapshot<String> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return FlutterFlowDropDown<String>(
                    controller: _model.cmbIdentificacionValueController ??=
                        FormFieldController<String>(
                      _model.cmbIdentificacionValue ??= '',
                    ),
                    options: ["Cargando..."],
                    optionLabels: ["Cargando..."],
                    onChanged: (val) =>
                        setState(() => _model.cmbIdentificacionValue = val),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF101213),
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                    hintText: 'Seleccionar Tipo de Identificación',
                    icon: Icon(
                      Icons.pin_outlined,
                      color: Color(0xFF57636C),
                      size: 22,
                    ),
                    fillColor: Colors.white,
                    elevation: 2,
                    borderColor: Color(0xFF57636C),
                    borderWidth: 0,
                    borderRadius: 8,
                    margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    hidesUnderline: true,
                    isSearchable: false,
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    return FlutterFlowDropDown<String>(
                      controller: _model.cmbIdentificacionValueController ??=
                          FormFieldController<String>(
                        _model.cmbIdentificacionValue ??= '',
                      ),
                      options: List<String>.from(json
                          .decode(snapshot.data!)
                          .map((data) => TipoIdentificacion.fromJson(data)
                              .codigo
                              .toString())),
                      optionLabels: List<String>.from(json
                          .decode(snapshot.data!)
                          .map((data) => TipoIdentificacion.fromJson(data)
                              .tipoIdentificacion)),
                      onChanged: (val) async {
                        setState(() {
                          _model.cmbIdentificacionValue = val;
                        });
                        if (val == "07" &&
                            _model.txtIdentificacionController.text !=
                                "9999999999999") {
                          setState(() {
                            cargando2 = true;
                          });
                          ApiCallResponse adquiriente =
                              await GenerarFacturaCall.buscarAdquiriente(
                            identificacion: "9999999999999",
                          ).then((value) {
                            cargando2 = false;
                            return value;
                          });
                          final adqui =
                              json.encode(adquiriente.jsonBody['data']);
                          setState(() {
                            txtActivoConsumidorFinal = false;
                            _model.cmbIdentificacionValue = val;
                            _model.txtNombresController.text =
                                GenerarFacturaCall.razonSocial(
                              (json.decode(adqui) ?? ''),
                            ).toString();
                            _model.txtIdentificacionController.text =
                                "9999999999999";
                            _model.txtDireccionController.text =
                                GenerarFacturaCall.direccion(
                              (json.decode(adqui) ?? ''),
                            ).toString();
                            _model.txtTelefonoController.text =
                                GenerarFacturaCall.telefono(
                              (json.decode(adqui) ?? ''),
                            ).toString();
                            _model.txtEmailController.text =
                                FFAppState().emailUsuario;
                            _model.txtDescuentoController.text =
                                GenerarFacturaCall.descuentoAdquiriente(
                              (json.decode(adqui) ?? ''),
                            ).toString();
                            _model.cmbIdentificacionValueController?.value =
                                GenerarFacturaCall
                                    .tipoIdentificacionAdquiriente(
                              (json.decode(adqui) ?? ''),
                            ).toString();
                          });
                        } else if (val != "07" &&
                            _model.txtIdentificacionController.text ==
                                "9999999999999") {
                          setState(() {
                            _model.cmbIdentificacionValue = val;
                            txtActivoConsumidorFinal = true;
                            _model.txtIdentificacionController?.clear();
                            _model.txtNombresController?.clear();
                            _model.txtTelefonoController?.clear();
                            _model.txtEmailController?.clear();
                            _model.txtDireccionController?.clear();
                            _model.txtMontoController?.clear();
                            _model.txtImpuestosController?.clear();
                            _model.cmbIdentificacionValueController?.reset();
                          });
                        }
                      },
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF101213),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                      hintText: 'Seleccionar Tipo de Identificación',
                      icon: Icon(
                        Icons.pin_outlined,
                        color: Color(0xFF57636C),
                        size: 22,
                      ),
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Color(0xFF57636C),
                      borderWidth: 0,
                      borderRadius: 8,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                      isSearchable: false,
                    );
                  } else {
                    return const Text('Sin Información');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomFormField(labelText: 'Nombres y apellidos / razón social*', controller: _model.txtNombresController!, validator: _model.txtNombresControllerValidator.asValidator(context), context: context, maxLength: 300, enabled: txtActivoConsumidorFinal, formatters: []),
          ),

          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
            child: TextFormField(
              controller: _model.txtTelefonoController,
              enabled: txtActivoConsumidorFinal,
              obscureText: false,
              maxLength: 10,
              decoration: customImputDecoration(context, txtActivoConsumidorFinal, 'Teléfono*'),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF090F13),
                    fontWeight: FontWeight.normal,
                  ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'\d')),
              ],
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              validator:
                  _model.txtTelefonoControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r"^[\S+@\S+\.\S]+$"))
              ],
              enabled: txtActivoConsumidorFinal,
              controller: _model.txtEmailController,
              obscureText: false,
              decoration: customImputDecoration(context, txtActivoConsumidorFinal, 'Email*'),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF090F13),
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.start,
              keyboardType: TextInputType.emailAddress,
              validator:
                  _model.txtEmailControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
            child: TextFormField(
              controller: _model.txtDescuentoController,
              obscureText: false,
              decoration: customImputDecoration(context, true, 'Descuento'),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF090F13),
                    fontWeight: FontWeight.normal,
                  ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                LengthLimitingTextInputFormatter(3),
              ],
              textAlign: TextAlign.start,
              onChanged: (value) async {
                if (value.isNotEmpty) {
                  int? parsedValue = int.tryParse(value);
                  if (listaObjetosProductos.length > 0) {
                    setState(() {
                      precioMonto = 0;
                      valorIVA = 0;
                    });
                    for (var element in listaObjetosProductos) {
                      double precio =
                          element.valor + element.valor * (element.iva / 100);
                      precioMonto += (precio) * element.cantidad;
                      valorIVA += (element.valor * element.cantidad) *
                          (element.iva / 100);
                    }
                    setState(() {
                      _model.txtMontoController.text =
                          precioMonto.toStringAsFixed(2);

                      _model.txtImpuestosController.text =
                          valorIVA.toStringAsFixed(2);
                    });
                  }
                  setState(() {
                    descuento = parsedValue!;
                  });
                  if (parsedValue == null ||
                      parsedValue < 0 ||
                      parsedValue > 100) {
                    _model.txtDescuentoController.text = '0';
                  }
                }
              },
              keyboardType: TextInputType.number,
              validator:
                  _model.txtDescuentoControllerValidator.asValidator(context),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.1, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 12.0),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                      '\n'), // Restringe el salto de línea
                  // Otros formateadores de entrada si es necesario
                ],
                enabled: txtActivoConsumidorFinal,
                controller: _model.txtDireccionController,
                obscureText: false,
                decoration: customImputDecoration(context, txtActivoConsumidorFinal, 'Dirección*'),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF090F13),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                maxLength: 500,
                textAlign: TextAlign.start,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                validator:
                    _model.txtDireccionControllerValidator.asValidator(context),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
            child: TextFormField(
              maxLength: 300,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              controller: _model.txtObservacionesController,
              obscureText: false,
              decoration: customImputDecoration(context, true, 'Observaciones'),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF090F13),
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.start,
              validator: _model.txtObservacionesControllerValidator
                  .asValidator(context),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      cambiarPestana(1); //
                    },
                    text: 'Lista Productos',
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 25,
                    ),
                    options: FFButtonOptions(
                      height: 50,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF4A70C8),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Color(0xFF4A70C8),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget productosWidget(BuildContext context, int id, int numero,
      String nombre, double cantidad, String precio, int valorIva) {
    final String precioTotal =
        (cantidad * double.parse(precio)).toStringAsFixed(4);
    final String iva =
        (double.parse(precio) * (valorIva / 100)).toStringAsFixed(2);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Nombre: $nombre',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0A101F),
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Cantidad: $cantidad',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0A101F),
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Subtotal: $precio',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0A101F),
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'IVA: $iva',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF0A101F),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: FlutterFlowIconButton(
                              borderColor: Color(0xFF4A70C8),
                              borderRadius: 20,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor: Colors.white,
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF4A70C8),
                                size: 24,
                              ),
                              onPressed: () {
                                _focusTextField();
                                setState(() {
                                  idProducto = id;
                                  _model.txtPrecioUnitarioController.text =
                                      (listaObjetosProductos
                                              .where((element) =>
                                                  element.id_producto == id)
                                              .first
                                              .valor)
                                          .toStringAsFixed(2);
                                  setState(() {
                                    precioMonto -= ((listaObjetosProductos
                                                .where((element) =>
                                                    element.id_producto == id)
                                                .first
                                                .valor) +
                                            listaObjetosProductos
                                                .where((element) =>
                                                    element.id_producto == id)
                                                .first
                                                .valor) *
                                        listaObjetosProductos
                                            .where((element) =>
                                                element.id_producto == id)
                                            .first
                                            .cantidad;
                                    valorIVA = precioMonto *
                                        (listaObjetosProductos
                                            .where((element) =>
                                                element.id_producto == id)
                                            .first
                                            .iva);

                                    if (precioMonto <= 0) {
                                      precioMonto = 0;
                                      _model.txtMontoController.text = '';
                                    } else {
                                      _model.txtMontoController.text =
                                          (precioMonto).toStringAsFixed(2);
                                      _model.txtImpuestosController.text =
                                          (valorIVA).toStringAsFixed(2);
                                    }
                                  });

                                  _model.txtCantidadController.text =
                                      listaObjetosProductos
                                          .where((element) =>
                                              element.id_producto == id)
                                          .first
                                          .cantidad
                                          .toString();
                                  listaObjetosProductos.removeWhere(
                                      (element) => element.id_producto == id);
                                  vectorObjetos.removeWhere(
                                      (element) => element.id_producto == id);
                                  String jsonVectorObjetos = jsonEncode(
                                      vectorObjetos
                                          .map((e) => e.toJson())
                                          .toList());
                                  FFAppState().jsonProductos =
                                      jsonVectorObjetos;
                                  listaIds
                                      .removeWhere((element) => element == id);
                                  respuestaListaProductos =
                                      ProductosCall.obtenerListaProductos(
                                              idCliente: FFAppState().idCliente,
                                              idProducto: listaIds.length != 0
                                                  ? listaIds.join(',')
                                                  : '0')
                                          .then((value) {
                                    setState(() {
                                      listaAux = jsonDecode(value.bodyText);
                                      _model.cmbProductoValueController?.value =
                                          idProducto.toString();
                                    });

                                    return value.bodyText;
                                  });
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.black87,
                            borderRadius: 20,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Colors.white,
                            icon: Icon(
                              Icons.delete,
                              color: Color(0xFF4A70C8),
                              size: 24,
                            ),
                            onPressed: () {
                              setState(() {
                                setState(() {
                                  precioMonto -= ((listaObjetosProductos
                                                  .where((element) =>
                                                      element.id_producto == id)
                                                  .first
                                                  .valor *
                                              (listaObjetosProductos
                                                      .where((element) =>
                                                          element.id_producto ==
                                                          id)
                                                      .first
                                                      .iva /
                                                  100)) +
                                          listaObjetosProductos
                                              .where((element) =>
                                                  element.id_producto == id)
                                              .first
                                              .valor) *
                                      listaObjetosProductos
                                          .where((element) =>
                                              element.id_producto == id)
                                          .first
                                          .cantidad;
                                  if (precioMonto <= 0) {
                                    precioMonto = 0;
                                    _model.txtMontoController.text = '';
                                  } else {
                                    _model.txtMontoController.text =
                                        (precioMonto).toStringAsFixed(2);
                                    _model.txtImpuestosController.text =
                                        valorIVA.toStringAsFixed(2);
                                  }
                                });
                                listaIds
                                    .removeWhere((element) => element == id);
                                listaObjetosProductos.removeWhere(
                                    (element) => element.id_producto == id);
                                String jsonString = jsonEncode(
                                    listaObjetosProductos
                                        .map((e) => e.toJson())
                                        .toList());
                                vectorObjetos.removeWhere(
                                    (element) => element.id_producto == id);
                                String jsonVectorObjetos = jsonEncode(
                                    vectorObjetos
                                        .map((e) => e.toJson())
                                        .toList());
                                FFAppState().jsonProductos = jsonVectorObjetos;
                                respuestaListaProductos =
                                    ProductosCall.obtenerListaProductos(
                                            idCliente: FFAppState().idCliente,
                                            idProducto: listaIds.length != 0
                                                ? listaIds.join(',')
                                                : '0')
                                        .then((value) {
                                  setState(() {
                                    listaAux = jsonDecode(value.bodyText);
                                    _model.cmbProductoValueController?.value =
                                        "";
                                  });
                                  return value.bodyText;
                                });
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ],
    );
  }

  ProductoModel _findProductByCode(
      String code, List<ProductoModel> productList) {
    for (var prod in productList) {
      for (var pro in listaObjetosProductos) {
        if (pro.codigo == code) {
          customSnackBar(
              context, 'El producto buscado ya se encuentra en la lista.');
          return ProductoModel.empty(id: -1);
        }
      }

      if (prod.codigo == code) {
        setState(() {
          _model.cmbProductoValueController!.value = prod.codigo;
          _model.txtCantidadController.text = "1";
          _model.txtPrecioUnitarioController.text =
              prod.precioUnitario.toStringAsFixed(2);
          idProducto = prod.id;
        });
        return prod;
      }
    }
    return ProductoModel.empty(id: 0);
  }
}

class Producto {
  int id_producto;
  int numero;
  String codigo;
  String descripcion;
  double cantidad;
  double valor;
  int codigoIva;
  int iva;
  Widget productoW;

  Producto(this.id_producto, this.numero, this.codigo, this.descripcion,
      this.cantidad, this.valor, this.codigoIva, this.iva, this.productoW);

  Map<String, dynamic> toJson() {
    return {
      'id_producto': id_producto,
      'descripcion': descripcion,
      'codigo': codigo,
      "valorIce": 0,
      'valor': valor,
      "cantidad": cantidad,
      'codigoIva': codigoIva,
      'iva': iva
    };
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> mensajeError(
    BuildContext context, String mensaje) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        mensaje,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Outfit',
              color: Color(0xFF57636C),
            ),
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: Color.fromARGB(255, 252, 252, 252),
    ),
  );
}
