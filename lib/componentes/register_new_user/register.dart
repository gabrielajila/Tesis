import 'dart:convert';

import 'package:facturito/index.dart';
import 'package:facturito/shared/customSnackBar.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../backend/api_requests/api_calls.dart';
import '../../models/model_resp_simple.dart';
import '../../shared/capcha/slider_capcha.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'register_model.dart';
export 'register_model.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late RegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late String logo;
  late String rucIngresado;
  String _errorText = '';
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterModel());

    _model.txtIdentificacionController ??= TextEditingController();
    _model.txtNombresController ??= TextEditingController();
    _model.txtApellidosController ??= TextEditingController();
    _model.txtCorreoElectronicoController ??= TextEditingController();
    _model.txtTelefonoController ??= TextEditingController();
    _model.txtUsuarioController ??= TextEditingController();
    _model.txtClaveController ??= TextEditingController();
    _model.txtPasswordController ??= TextEditingController();
    rucIngresado = "";
    setState(() {
      logo = "";
    });
  }

  bool _isValidRUC(String input) {
    // Implementa la validación de RUC con una expresión regular
    // Por ejemplo:
    return RegExp(r'^\d{13}$').hasMatch(input);
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
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
                child: Image.network(
                  'https://i.ibb.co/K98jf2H/Facorto.png',
                  width: 200,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 1,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: Color(0xFF0A101F),
                          labelPadding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 20.0, 24.0, 0.0),
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF0F1113),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          indicatorColor: Color(0xFF4A70C8),
                          tabs: [
                            Tab(
                              text: 'Registro del Sistema',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 24.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Datos Personales',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0A101F),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Image.memory(
                                        logo != ""
                                            ? base64Decode(logo)
                                            : base64Decode(
                                                '''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'''),
                                        width: 335,
                                        height: 168,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            setState(() =>
                                                _model.isDataUploading1 = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();
                                            } finally {
                                              _model.isDataUploading1 = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedMedia.length) {
                                              setState(() {
                                                _model.uploadedLocalFile1 =
                                                    selectedUploadedFiles.first;
                                                logo = base64Encode(
                                                    selectedUploadedFiles.first
                                                        .bytes as List<int>);
                                              });
                                            } else {
                                              setState(() {});
                                              return;
                                            }
                                          }
                                        },
                                        text: 'Logo',
                                        options: FFButtonOptions(
                                          width: 130,
                                          height: 40,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: Color(0xFF4A70C8),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 20, 0),
                                      child: TextFormField(
                                        controller:
                                            _model.txtIdentificacionController,
                                        obscureText: false,
                                        onChanged: (value) {
                                          String input = value.trim();
                                          if (input.isNotEmpty) {
                                            if (_isValidRUC(input)) {
                                              setState(() {
                                                _errorText =
                                                    ''; // Limpiar el mensaje de error cuando el RUC sea válido
                                              });
                                            } else {
                                              setState(() {
                                                _errorText = 'RUC inválido';
                                              });
                                            }
                                          } else {
                                            setState(() {
                                              _errorText = '';
                                            });
                                          }
                                        },
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Identificación / RUC',
                                          errorText: _errorText.isNotEmpty
                                              ? _errorText
                                              : null,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF95A1AC),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0A101F),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                          suffixIcon: Icon(
                                            Icons.credit_card,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .txtIdentificacionControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          _model.txtIdentificacionMask,
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: TextFormField(
                                        maxLength: 250,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp(
                                              r'^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ&.\s]*$'))
                                        ],
                                        controller: _model.txtNombresController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Nombres',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF95A1AC),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0A101F),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 20.0, 24.0),
                                          suffixIcon: Icon(
                                            Icons.account_box,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType: TextInputType.name,
                                        validator: _model
                                            .txtNombresControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: TextFormField(
                                        maxLength: 250,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(RegExp(
                                              r'^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ&.\s]*$'))
                                        ],
                                        controller:
                                            _model.txtApellidosController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Apellidos',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF95A1AC),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0A101F),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 20.0, 24.0),
                                          suffixIcon: Icon(
                                            Icons.account_box_sharp,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType: TextInputType.name,
                                        validator: _model
                                            .txtApellidosControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r"^[\S+@\S+\.\S]+$"))
                                        ],
                                        controller: _model
                                            .txtCorreoElectronicoController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Correo Electrónico',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF95A1AC),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0A101F),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 20.0, 24.0),
                                          suffixIcon: Icon(
                                            Icons.email,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _model
                                            .txtCorreoElectronicoControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 20, 0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: FlutterFlowDropDown<String>(
                                          fillColor: Colors.white,
                                          controller: _model
                                                  .dropDownCiudadValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            "Alamor",
                                            "Alausí",
                                            "Alfredo Baquerizo Moreno",
                                            "Amaluza",
                                            "Ambato",
                                            "Arajuno",
                                            "Archidona",
                                            "Arenillas",
                                            "Atacames",
                                            "Atuntaqui",
                                            "Azogues",
                                            "Baba",
                                            "Babahoyo",
                                            "Baeza",
                                            "Bahía de Caráquez",
                                            "Balao",
                                            "Balsas",
                                            "Balzar",
                                            "Baños de Agua Santa",
                                            "Biblián",
                                            "Bolívar",
                                            "Buena Fe",
                                            "Calceta",
                                            "Caluma",
                                            "Camilo Ponce Enríquez",
                                            "Canton Guano",
                                            "Cañar",
                                            "Cariamanga",
                                            "Carlos Julio Arosemena Tola",
                                            "Catacocha",
                                            "Catamayo",
                                            "Catarama",
                                            "Cayambe",
                                            "Celica",
                                            "Cevallos",
                                            "Chaguarpamba",
                                            "Chambo",
                                            "Chilla",
                                            "Chillanes",
                                            "Chimbo",
                                            "Chone",
                                            "Chordeleg",
                                            "Chunchi",
                                            "Cnel. Marcelino Maridueña",
                                            "Colimes",
                                            "Cotacachi",
                                            "Cuenca",
                                            "Cumandá",
                                            "Daule",
                                            "Déleg",
                                            "Durán",
                                            "Echeandía",
                                            "El Ángel",
                                            "El Carmen",
                                            "El Chaco",
                                            "El Corazón",
                                            "El Dorado de Cascales",
                                            "El Guabo",
                                            "El Pan",
                                            "El Pangui",
                                            "El Tambo",
                                            "El Triunfo",
                                            "Esmeraldas",
                                            "Flavio Alfaro",
                                            "General Villamil",
                                            "Girón",
                                            "Gonzanamá",
                                            "Gral. Antonio Elizalde",
                                            "Gral. Leonidas Plaza Gutiérrez",
                                            "Guachapala",
                                            "Gualaceo",
                                            "Gualaquiza",
                                            "Guamote",
                                            "Guaranda",
                                            "Guayaquil",
                                            "Guayzimi",
                                            "Huaca",
                                            "Huamboya",
                                            "Huaquillas",
                                            "Ibarra",
                                            "Isidro Ayora",
                                            "Jama",
                                            "Jaramijó",
                                            "Jipijapa",
                                            "Junín",
                                            "La Bonita",
                                            "La Concordia",
                                            "La Joya de los Sachas",
                                            "La Libertad",
                                            "La Maná",
                                            "La Troncal",
                                            "La Victoria",
                                            "Las Naves",
                                            "Latacunga",
                                            "Logroño",
                                            "Loja",
                                            "Lomas de Sargentillo",
                                            "Loreto",
                                            "Lumbaqui",
                                            "Macará",
                                            "Macas",
                                            "Machachi",
                                            "Machala",
                                            "Manta",
                                            "Marcabelí",
                                            "Mera",
                                            "Milagro",
                                            "Mira",
                                            "Mocache",
                                            "Mocha",
                                            "Montalvo",
                                            "Montecristi",
                                            "Muisne",
                                            "Nabón",
                                            "Naranjal",
                                            "Naranjito",
                                            "Nobol",
                                            "Nueva Loja",
                                            "Olmedo",
                                            "Olmedo",
                                            "Oña",
                                            "Otavalo",
                                            "Pablo Sexto",
                                            "Paccha",
                                            "Paján",
                                            "Palanda",
                                            "Palenque",
                                            "Palestina",
                                            "Pallatanga",
                                            "Palora",
                                            "Paquisha",
                                            "Pasaje",
                                            "Patate",
                                            "Paute",
                                            "Pedernales",
                                            "Pedro Carbo",
                                            "Pedro Vicente Maldonado",
                                            "Pelileo",
                                            "Penipe",
                                            "Pichincha",
                                            "Píllaro",
                                            "Pimampiro",
                                            "Pindal",
                                            "Piñas",
                                            "Portovelo",
                                            "Portoviejo",
                                            "Pucará",
                                            "Puebloviejo",
                                            "Puerto Ayora",
                                            "Puerto Baquerizo Moreno",
                                            "Puerto El Carmen de Putumayo",
                                            "Puerto Francisco de Orellana",
                                            "Puerto López",
                                            "Puerto Quito",
                                            "Puerto Villamil",
                                            "Pujilí",
                                            "Puyo",
                                            "Quero",
                                            "Quevedo",
                                            "Quilanga",
                                            "Quinsaloma",
                                            "Quito",
                                            "Riobamba",
                                            "Rioverde",
                                            "Rocafuerte",
                                            "Rosa Zárate",
                                            "Salinas",
                                            "Salitre",
                                            "Samborondón",
                                            "San Fernando",
                                            "San Gabriel",
                                            "San Juan Bosco",
                                            "San Lorenzo",
                                            "San Miguel",
                                            "San Miguel de Los Bancos",
                                            "San Miguel de Salcedo",
                                            "San Vicente",
                                            "Sangolquí",
                                            "Santa Ana",
                                            "Santa Clara",
                                            "Santa Elena",
                                            "Santa Isabel",
                                            "Santa Lucía",
                                            "Santa Rosa",
                                            "Santiago",
                                            "Santiago de Méndez",
                                            "Santo Domingo",
                                            "Saquisilí",
                                            "Saraguro",
                                            "Sevilla de Oro",
                                            "Shushufindi",
                                            "Sigchos",
                                            "Sígsig",
                                            "Simón Bolívar",
                                            "Sozoranga",
                                            "Sucre",
                                            "Sucúa",
                                            "Suscal",
                                            "Tabacundo",
                                            "Taisha",
                                            "Tarapoa",
                                            "Tena",
                                            "Tiputini",
                                            "Tisaleo",
                                            "Tosagua",
                                            "Tulcán",
                                            "Urcuquí",
                                            "Valdez",
                                            "Valencia",
                                            "Velasco Ibarra",
                                            "Ventanas",
                                            "Villa La Unión",
                                            "Vinces",
                                            "Yacuambi",
                                            "Yaguachi",
                                            "Yantzaza",
                                            "Zamora",
                                            "Zapotillo",
                                            "Zaruma",
                                            "Zumba",
                                            "Zumbi",
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.dropDownCiudadValue = val),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          searchHintTextStyle:
                                              GoogleFonts.getFont(
                                            'Outfit',
                                            color: Color(0xFF95A1AC),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Ciudad',
                                          searchHintText: 'Buscar Ciudad',
                                          icon: Icon(
                                            Icons.list_alt_sharp,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                          elevation: 2,
                                          borderColor: Color(0xFF95A1AC),
                                          borderWidth: 1,
                                          borderRadius: 8,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                          isSearchable: true,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      child: TextFormField(
                                        maxLength: 10,
                                        controller:
                                            _model.txtTelefonoController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Teléfono',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF95A1AC),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0A101F),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 20.0, 24.0),
                                          suffixIcon: Icon(
                                            Icons.phone,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'\d')),
                                        ],
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .txtTelefonoControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Text(
                                        'Datos Usuario',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0A101F),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 20, 0),
                                      child: TextFormField(
                                        maxLength: 50,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r"[^-\s]"))
                                        ],
                                        controller: _model.txtUsuarioController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Usuario',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF95A1AC),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0A101F),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                          suffixIcon: Icon(
                                            Icons.person,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        validator: _model
                                            .txtUsuarioControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 20, 20),
                                      child: TextFormField(
                                        maxLength: 15,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r"[^-\s]"))
                                        ],
                                        controller: _model.txtClaveController,
                                        obscureText: !_model.txtClaveVisibility,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Contraseña',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF95A1AC),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0A101F),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model.txtClaveVisibility =
                                                  !_model.txtClaveVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.txtClaveVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: Color(0xFF757575),
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        validator: _model
                                            .txtClaveControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Text(
                                        'Firma',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0A101F),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 20, 0),
                                      child: TextFormField(
                                        maxLength: 250,
                                        controller:
                                            _model.txtPasswordController,
                                        obscureText:
                                            !_model.txtPasswordVisibility,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Clave',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF95A1AC),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0A101F),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF841010),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 24, 20, 24),
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => _model
                                                      .txtPasswordVisibility =
                                                  !_model.txtPasswordVisibility,
                                            ),
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              _model.txtPasswordVisibility
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: Color(0xFF757575),
                                              size: 22,
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        validator: _model
                                            .txtPasswordControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 24, 20, 20),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final selectedFile =
                                              await selectFile();
                                          if (selectedFile != null) {
                                            setState(() =>
                                                _model.isDataUploading = true);
                                            FFUploadedFile?
                                                selectedUploadedFile;
                                            try {
                                              selectedUploadedFile =
                                                  FFUploadedFile(
                                                name: selectedFile.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: selectedFile.bytes,
                                              );
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFile != null) {
                                              setState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFile!;
                                              });
                                            } else {
                                              setState(() {});
                                              return;
                                            }
                                          }
                                        },
                                        text: 'Subir archivo firma',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 24),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: Color(0xFF4A70C8),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 3,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await launchURL(
                                                'https://www.tws2.io/contfiables');
                                          },
                                          child: Text(
                                            'Terminos y Condiciones',
                                            style: TextStyle(
                                              color: Color(0xFF57636C),
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              shape: CircleBorder(),
                                            ),
                                            unselectedWidgetColor:
                                                Color(0xFF757575),
                                          ),
                                          child: Checkbox(
                                            value: _model.checkboxValue ??=
                                                false,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                  .checkboxValue = newValue!);
                                            },
                                            activeColor: Color(0xFF757575),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          try {
                                            if (_model.checkboxValue == true) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return Dialog(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: SliderCaptcha(
                                                          colorBar:
                                                              Color(0xFF57636C),
                                                          colorCaptChar:
                                                              Color(0xFFF44336),
                                                          title:
                                                              "Deslice para Verificar que es Humano",
                                                          image: Image.asset(
                                                            'assets/images/paisaje.png',
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                          onConfirm: (value) =>
                                                              Future.delayed(
                                                                      const Duration(
                                                                          seconds:
                                                                              1))
                                                                  .then(
                                                            (value) async {
                                                              _model.respuestaRegistro = await RegistroCall.guardarClienteCall(
                                                                  logo: _model.uploadedLocalFile1.bytes!.length > 0
                                                                      ? base64Encode(_model.uploadedLocalFile1.bytes
                                                                          as List<
                                                                              int>)
                                                                      : "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",
                                                                  identificacion:
                                                                      _model
                                                                          .txtIdentificacionController
                                                                          .text,
                                                                  nombres: _model
                                                                      .txtNombresController
                                                                      .text,
                                                                  apellidos: _model
                                                                      .txtApellidosController
                                                                      .text,
                                                                  ciudad: _model
                                                                      .dropDownCiudadValue,
                                                                  telefono: _model.txtTelefonoController.text,
                                                                  idTipoIdentificacion: 1,
                                                                  emailCliente: _model.txtCorreoElectronicoController.text,
                                                                  user: _model.txtUsuarioController.text,
                                                                  clave: _model.txtClaveController.text,
                                                                  file64: base64Encode(_model.uploadedLocalFile.bytes as List<int>),
                                                                  password: _model.txtPasswordController.text);
                                                              print(
                                                                  'response save: ${_model.respuestaRegistro?.jsonBody}');
                                                              RespSimple
                                                                  respSimple =
                                                                  RespSimple.trasformarRespuesta(_model
                                                                      .respuestaRegistro!
                                                                      .bodyText);
                                                              if (respSimple
                                                                      .codigo ==
                                                                  "0") {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Aviso'),
                                                                      content: Text(
                                                                          '${respSimple.mensaje}'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed:
                                                                              () async {
                                                                            await Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                                builder: (context) => HomePageWidget(),
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      '${respSimple.mensaje}',
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
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            } else if (_model
                                                .txtIdentificacionController
                                                .text
                                                .isEmpty) {
                                                  customSnackBar(context, 'RUC debe ser ingresado');
                                            } else if (_model
                                                    .txtIdentificacionController
                                                    .text
                                                    .length !=
                                                13) {
                                                  customSnackBar(context, 'RUC debe tener 13 caracteres');
                                            } else if (_model
                                                .txtNombresController
                                                .text
                                                .isEmpty) {
                                              customSnackBar(context,
                                                  'Los Nombres deben ser ingresados');
                                            } else if (_model
                                                .txtCorreoElectronicoController
                                                .text
                                                .isEmpty) {
                                              customSnackBar(context,
                                                  'El Correo Electrónico debe ser ingresado');
                                            } else if (_model
                                                    .dropDownCiudadValue ==
                                                null) {
                                              customSnackBar(context,
                                                  'La Ciudad debe ser seleccionada');
                                            } else if (_model
                                                .txtTelefonoController
                                                .text
                                                .isEmpty) {
                                              customSnackBar(context,
                                                  'El teléfono debe ser ingresado');
                                            } else if (_model
                                                .txtUsuarioController
                                                .text
                                                .isEmpty) {
                                              customSnackBar(context,
                                                  'El Nombre de Usuario debe ser ingresado');
                                            } else if (_model.txtClaveController
                                                .text.isEmpty) {
                                              customSnackBar(context,
                                                  'La contraseña debe ser ingresada');
                                            } else if (_model
                                                .txtPasswordController
                                                .text
                                                .isEmpty) {
                                              customSnackBar(context,
                                                  'La Clave de la Firma debe ser ingresada');
                                            } else if (_model
                                                    .uploadedLocalFile.bytes ==
                                                null) {
                                              customSnackBar(context,
                                                  'Debe seleccionar el archivo de la firma');
                                            } else {
                                              customSnackBar(context,
                                                  'Terminos y Condiciones No Aceptados');
                                            }
                                          } catch (e) {
                                            customSnackBar(context,
                                                'Error en el Registro / Revise los datos ingresados');
                                          }
                                        },
                                        text: 'Registrar',
                                        options: FFButtonOptions(
                                          width: 230.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF4A70C8),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePageWidget(),
                                                ),
                                              );
                                            },
                                            text: 'Inicie Sesión',
                                            options: FFButtonOptions(
                                              height: 40,
                                              color: Colors.white,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF0A101F),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              // await Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>null,
                                              //   ),
                                              // );
                                            },
                                            text: 'Solicitar Firma',
                                            options: FFButtonOptions(
                                              height: 40,
                                              color: Colors.white,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF0A101F),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
}
