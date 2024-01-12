import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/flutter_flow/flutter_flow_drop_down.dart';
import 'package:facturito/flutter_flow/form_field_controller.dart';
import 'package:facturito/models/Adquiriente.dart';
import 'package:facturito/models/TipoIdentificacion.model.dart';
import '../../enviroments.dart';
import '../../models/model_resp_simple.dart';
import '../../shared/messageDialog.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'actualizar_cliente_model.dart';
export 'actualizar_cliente_model.dart';

class ActualizarClienteWidget extends StatefulWidget {
  ActualizarClienteWidget({Key? key, required this.cliente}) : super(key: key);
  final Adquiriente cliente;
  @override
  _ActualizarClienteWidgetState createState() =>
      _ActualizarClienteWidgetState();
}

class _ActualizarClienteWidgetState extends State<ActualizarClienteWidget> {
  late AdquirienteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdquirienteModel());

    _model.identificacionTextController ??= TextEditingController();
    _model.razonSocialTextController ??= TextEditingController();
    _model.emailTextController ??= TextEditingController();
    _model.telefonoTextController ??= TextEditingController();
    _model.direccionTextController ??= TextEditingController();
    _model.tipoIdentificacionDropDownValueController ??=
        FormFieldController(null);

    _model.identificacionTextController.text =
        "${widget.cliente.identificacion}";
    _model.razonSocialTextController.text = "${widget.cliente.razonSocial}";
    _model.emailTextController.text = "${widget.cliente.emailAdquiriente}";
    _model.telefonoTextController.text = "${widget.cliente.telefono}";
    _model.direccionTextController.text = "${widget.cliente.direccion}";
    _model.tipoIdentificacionDropDownValueController?.value =
        "${widget.cliente.idTipoIdentificacion.tipoIdentificacion}";
    print('modelo ${_model.tipoIdentificacionDropDownValueController?.value}');
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

    return AdquirienteForm(model: _model, widget: widget);
  }
}

class AdquirienteForm extends StatefulWidget {
  const AdquirienteForm({
    super.key,
    required AdquirienteModel model,
    required this.widget,
  }) : _model = model;

  final AdquirienteModel _model;
  final ActualizarClienteWidget widget;
  @override
  State<AdquirienteForm> createState() => _AdquirienteFormState();
}

class _AdquirienteFormState extends State<AdquirienteForm> {
  late TipoIdentificacion tipoIdentificacionSeleccionada =
      widget.widget.cliente.idTipoIdentificacion;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xB20B191E),
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
                    borderColor: Colors.transparent,
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
                color: Colors.transparent,
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
                                'Actualizar Cliente',
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
                            key: widget._model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Container(
                              width: 339.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 10.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: widget
                                          ._model.identificacionTextController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Identificación',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: widget._model
                                          .identificacionTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 10.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: widget
                                          ._model.razonSocialTextController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Razón social',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      validator: widget._model
                                          .razonSocialTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 10.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          widget._model.emailTextController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Correo',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: widget
                                          ._model.emailTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 10.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          widget._model.telefonoTextController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Teléfono',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: widget._model
                                          .telefonoTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 10.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          widget._model.direccionTextController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Dirección',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: widget._model
                                          .direccionTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  _dropDownTipoAdquiriente(),
                                ],
                              ),
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
                        child: UpdateClient(
                            model: widget._model,
                            widget: widget.widget,
                            tipoIdentificacioSeleccionado:
                                tipoIdentificacionSeleccionada),
                      ),
                      SizedBox(height: 50),
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

  FutureBuilder<ApiCallResponse> _dropDownTipoAdquiriente() {
    List<TipoIdentificacion> listTiposIdentificacion;

    return FutureBuilder(
        future: AdquirienteCall.obtenerListaTipoIdentificacion(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            print('tipos iudentificacion ${snapshot.data.response.body}');
            listTiposIdentificacion =
                tipoIdentificacionFromJson(snapshot.data.response.body);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: FlutterFlowDropDown(
                controller:
                    widget._model.tipoIdentificacionDropDownValueController ??=
                        FormFieldController<String>(null),
                options: listTiposIdentificacion
                    .map((ti) => ti.tipoIdentificacion)
                    .toList(),
                onChanged: (val) {
                  listTiposIdentificacion.forEach((ti) {
                    if (ti.tipoIdentificacion == val) {
                      tipoIdentificacionSeleccionada = ti;
                    }
                  });
                  setState(() => widget._model.tipoIdentificacionDropDownValue =
                      val.toString());
                },
                // width: 327.0,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: 'Seleccione el tipo de identificación',
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
        });
  }
}

class UpdateClient extends StatelessWidget {
  const UpdateClient({
    super.key,
    required AdquirienteModel model,
    required this.widget,
    required this.tipoIdentificacioSeleccionado,
  }) : _model = model;

  final AdquirienteModel _model;
  final ActualizarClienteWidget widget;
  final TipoIdentificacion tipoIdentificacioSeleccionado;

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        try {
          Adquiriente adquiriente = Adquiriente(
              descuento: 0,
              direccion: _model.direccionTextController.text,
              emailAdquiriente: _model.emailTextController.text,
              id: widget.cliente.id,
              identificacion: _model.identificacionTextController.text,
              razonSocial: _model.razonSocialTextController.text,
              telefono: _model.telefonoTextController.text,
              idTipoIdentificacion: tipoIdentificacioSeleccionado);
          ApiCallResponse response =
              await AdquirienteCall.registrarAdquirientes(adquiriente.toJson());
          RespSimple respSimple =
              RespSimple.trasformarRespuesta(response.bodyText ?? '');
          print('${respSimple.mensaje}');
          if (respSimple.codigo == '0') {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${respSimple.mensaje}')));
          } else {
            messageDialog(context, 'Error', respSimple.mensaje);
          }
        } catch (e) {
          messageDialog(
              context, 'Error', 'Error al proceder enviar petición $e');
        }
      },
      text: 'Guardar',
      options: FFButtonOptions(
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
