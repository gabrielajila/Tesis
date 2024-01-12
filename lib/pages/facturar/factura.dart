import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/componentes/actualizar_cliente/actualizar_cliente_widget.dart';
import 'package:facturito/componentes/actualizar_producto/producto_form_widget.dart';
import 'package:facturito/flutter_flow/flutter_flow_theme.dart';
import 'package:facturito/flutter_flow/form_field_controller.dart';
import 'package:facturito/models/TipoIdentificacion.model.dart';
import 'package:facturito/pages/facturar/facturar_widget.dart';
import 'package:flutter/material.dart';

import '../../flutter_flow/flutter_flow_drop_down.dart';
import '../../flutter_flow/flutter_flow_model.dart';

class Factura extends StatefulWidget {
  const Factura({super.key});

  @override
  State<Factura> createState() => _FacturaState();
}

class _FacturaState extends State<Factura> with TickerProviderStateMixin {
  late FacturarModel _modelFactura;
  late AdquirienteModel _model;

  late TipoIdentificacion tipoIdentificacionSeleccionada;
  late int _pageIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _model = createModel(context, () => AdquirienteModel());
    _modelFactura = createModel(context, () => FacturarModel());

    _model.identificacionTextController ??= TextEditingController();
    _model.razonSocialTextController ??= TextEditingController();
    _model.emailTextController ??= TextEditingController();
    _model.telefonoTextController ??= TextEditingController();
    _model.direccionTextController ??= TextEditingController();
    _model.descuentoTextController ??= TextEditingController();

    _model.tipoIdentificacionDropDownValueController ??=
        FormFieldController(null);
    super.initState();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: _pageIndex,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text('Datos adquiriente'),
                  icon: Icon(Icons.people_outline_outlined),
                ),
                Tab(
                    child: Text('Datos factura'),
                    icon: Icon(Icons.monetization_on_outlined)),
              ],
            ),
            title: Text('Facturar'),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              formAdquiriente(context),
              formFactura(context),
            ],
          ),
        ),
      ),
    );
  }

  Container formFactura(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.indigo[50],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
        child: Form(
          key: _modelFactura.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Container(
            width: double.infinity,
            child: ListView(
              children: [
                NewTextFormField(
                  labelText: 'Razón social adquiriente',
                  controller:
                      _model.razonSocialTextController as TextEditingController,
                  context: context,
                  editable: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'La razón social es requerida';
                    }
                    return null;
                  },
                ),
                NewTextFormField(
                  labelText: 'Correo adquiriente',
                  controller:
                      _model.emailTextController as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El correo es requerido';
                    }
                    return null;
                  },
                ),
                NewTextFormField(
                  labelText: 'Teléfono',
                  controller:
                      _model.telefonoTextController as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El teléfono es requerido';
                    }
                    return null;
                  },
                ),
                NewTextFormField(
                  labelText: 'Dirección',
                  controller:
                      _model.direccionTextController as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'La dirección es requerida';
                    }
                    return null;
                  },
                ),
                NewNumberFormField(
                  labelText: 'Descuento',
                  controller:
                      _model.descuentoTextController as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El descuento es requerido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    print('facturar');
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.indigo),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Facturar',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            Icon(
                              Icons.money,
                              size: 50,
                              color: Colors.white,
                            )
                          ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container formAdquiriente(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.indigo[50],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Container(
            width: double.infinity,
            child: ListView(
              children: [
                _dropDownTipoAdquiriente(),
                NewTextFormField(
                  labelText: 'Identificación',
                  controller: _model.identificacionTextController
                      as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'La identificación es requerida';
                    }
                    return null;
                  },
                ),
                NewTextFormField(
                  labelText: 'Razón social',
                  controller:
                      _model.razonSocialTextController as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'La razón social es requerida';
                    }
                    return null;
                  },
                ),
                NewTextFormField(
                  labelText: 'Correo adquiriente',
                  controller:
                      _model.emailTextController as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El correo es requerido';
                    }
                    return null;
                  },
                ),
                NewTextFormField(
                  labelText: 'Teléfono',
                  controller:
                      _model.telefonoTextController as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El teléfono es requerido';
                    }
                    return null;
                  },
                ),
                NewTextFormField(
                  labelText: 'Dirección',
                  controller:
                      _model.direccionTextController as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'La dirección es requerida';
                    }
                    return null;
                  },
                ),
                NewNumberFormField(
                  labelText: 'Descuento',
                  controller:
                      _model.descuentoTextController as TextEditingController,
                  context: context,
                  editable: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El descuento es requerido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    _tabController.animateTo(1);
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.indigo),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'factura',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 50,
                              color: Colors.white,
                            )
                          ])),
                )
              ],
            ),
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
            listTiposIdentificacion =
                tipoIdentificacionFromJson(snapshot.data.response.body);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: FlutterFlowDropDown(
                controller: _model.tipoIdentificacionDropDownValueController ??=
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
                  setState(() =>
                      _model.tipoIdentificacionDropDownValue = val.toString());
                },
                // width: 327.0,
                height: 80.0,
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
