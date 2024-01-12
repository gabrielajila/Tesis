import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/enviroments.dart';
import 'package:facturito/models/Producto.dart';
import 'package:facturito/models/model_resp_simple.dart';
import 'package:flutter/services.dart';

import '../../flutter_flow/flutter_flow_drop_down.dart';
import '../../flutter_flow/form_field_controller.dart';
import '../../models/cliente.dart';
import '../../shared/inputValidation.dart';
import '../../shared/messageDialog.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'actualizar_producto_model.dart';
export 'actualizar_producto_model.dart';

class ProductoFormWidget extends StatefulWidget {
  const ProductoFormWidget({Key? key, required this.producto})
      : super(key: key);
  final Producto producto;
  @override
  _ActualizarProductoWidgetState createState() =>
      _ActualizarProductoWidgetState();
}

class _ActualizarProductoWidgetState extends State<ProductoFormWidget> {
  late ProductoFormModel _model;
  late Producto producto = widget.producto;
  List<TarifaIva> listTarifaIva = [];
  TarifaIva? tarifaSeleccionada;
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductoFormModel());

    _model.codigoTextController ??= TextEditingController();
    _model.nombreTextController ??= TextEditingController();
    _model.precioTextController ??= TextEditingController();
    _model.infoAdicionalTextController ??= TextEditingController();
    _model.ivaTextController ??= TextEditingController();
    _model.ivaDropDownValueController ??= FormFieldController(null);

    _model.codigoTextController.text = producto.codigo;
    _model.nombreTextController.text = producto.nombreProducto;
    _model.precioTextController.text = producto.precioUnitario.toString();
    _model.infoAdicionalTextController.text = producto.informacionAdicional;
    _model.ivaTextController.text =
        producto.tarifaIva?.porcentaje.toString() ?? '';
    _model.ivaDropDownValueController?.value =
        "${producto.tarifaIva?.porcentaje.toString()}";

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF4A70C8),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.00, 1.00),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional(1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 16.0),
                  child: FlutterFlowIconButton(
                    borderColor: Color(0xFF4A70C8),
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 44.0,
                    fillColor: Color(0xFFF1F4F8),
                    icon: Icon(
                      Icons.close_rounded,
                      color: Color(0xFF57636C),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Material(
                color: Color(0xFF4A70C8),
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Enviroments.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Actualizar Producto',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 4.0,
                        thickness: 1.0,
                        color: Color(0xFFE0E3E7),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Enviroments.primaryColor,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 12.0),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                NewTextFormField(
                                  editable: true,
                                  controller: _model.codigoTextController
                                      as TextEditingController,
                                  labelText: 'Código de producto',
                                  context: context,
                                  validator: (value) => validarInput(
                                      value, 'El código es requerido'),
                                ),
                                NewTextFormField(
                                    editable: true,
                                    controller: _model.nombreTextController
                                        as TextEditingController,
                                    labelText: 'Nombre de producto',
                                    context: context,
                                    validator: (value) => validarInput(
                                        value, 'Nombre es requerido')),
                                NewTextFormField(
                                  editable: true,
                                  controller: _model.precioTextController
                                      as TextEditingController,
                                  labelText: 'Precio unitario sin iva',
                                  context: context,
                                  validator: (value) {
                                    try {
                                      if (value!.isEmpty)
                                        return 'El precio es requerido';

                                      double precio = double.parse(value);
                                      if (precio <= 0)
                                        return 'El precio debe ser mayor a cero';
                                      return null;
                                    } catch (e) {
                                      return 'El precio es requerido';
                                    }
                                  },
                                ),
                                NewTextFormField(
                                  editable: true,
                                  controller: _model.infoAdicionalTextController
                                      as TextEditingController,
                                  labelText: 'Información adicional',
                                  context: context,
                                  validator: _model
                                      .infoAdicionalTextControllerValidator
                                      .asValidator(context),
                                ),
                                _dropDownTarifaIva(
                                    producto.id == 0 ? false : true),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 4.0,
                        thickness: 1.0,
                        color: Color(0xFFE0E3E7),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: UpdateProdudctButton(
                            producto: producto, model: _model),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<ApiCallResponse> _dropDownTarifaIva(bool active) {
    return FutureBuilder(
      future: ProductoApiCall.obtenerListaIva(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          listTarifaIva = tarifaIvaFromJson(snapshot.data.response.body);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: FlutterFlowDropDown(
              disabled: active,
              controller: _model.ivaDropDownValueController ??=
                  FormFieldController<String>(null),
              options: listTarifaIva.map((iva) => iva.descripcion).toList(),
              onChanged: (val) {
                listTarifaIva.forEach((iv) {
                  if (iv.descripcion == val) {
                    tarifaSeleccionada = iv;
                    producto.tarifaIva = tarifaSeleccionada;
                  }
                });
                setState(() => _model.ivaDropDownValue = val.toString());
              },
              // width: 327.0,
              height: 50.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium,
              hintText: 'Seleccione IVA%',
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).alternate,
              borderWidth: 2.0,
              borderRadius: 8.0,
              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
              hidesUnderline: true,
              isSearchable: false,
              isMultiSelect: false,
            ),
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

class UpdateProdudctButton extends StatelessWidget {
  const UpdateProdudctButton({
    super.key,
    required this.producto,
    required ProductoFormModel model,
  }) : _model = model;

  final Producto producto;
  final ProductoFormModel _model;

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        try {
          print('tarifa iva: ${producto.tarifaIva?.idTarifaIva}');
          print('validator: ${_model.formKey.currentState!.validate()}');
          if (!_model.formKey.currentState!.validate()) {
            return;
          }
          Producto prod = Producto(
              id: producto.id,
              codigo: _model.codigoTextController.text,
              nombreProducto: _model.nombreTextController.text,
              precioUnitario: double.parse(_model.precioTextController.text),
              informacionAdicional: _model.infoAdicionalTextController.text,
              tarifaIva: producto.tarifaIva,
              // tarifaIva:tarifa,

              idCodigoIce: null,
              cliente: Cliente.withId(idCliente: FFAppState().idCliente),
              activo: true);
          ApiCallResponse response =
              await ProductoApiCall.registrarProducto(prod.toJson());
          RespSimple respSimple =
              RespSimple.trasformarRespuesta(response.bodyText ?? '');
          if (respSimple.codigo == '0') {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${respSimple.mensaje}')));
          } else {
            messageDialog(context, 'Error', respSimple.mensaje);
          }
        } catch (e) {
          messageDialog(
              context, 'Error', 'Error al proceder a guardar el produdcto $e');
        }
      },
      text: 'Guardar',
      options: FFButtonOptions(
        height: 40.0,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).alternate,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Readex Pro',
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
        elevation: 3.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}

class NewNumberFormField extends StatelessWidget {
  const NewNumberFormField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.context,
    required this.editable,
  });

  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final BuildContext context;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
      child: TextFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          enabled: editable,
          labelText: labelText,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        validator: validator,
      ),
    );
  }
}

class NewTextFormField extends StatelessWidget {
  const NewTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.context,
    required this.editable,
  });

  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final BuildContext context;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        controller: controller,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          enabled: editable,
          labelText: labelText,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
          hintStyle: FlutterFlowTheme.of(context).labelMedium,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        validator: validator,
      ),
    );
  }
}

