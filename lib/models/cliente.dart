//aqui un ejemplo de como podemos hacer las clases de modelo para poder ejecutar los metodos que yo haya hecho

import 'dart:convert';

import 'package:facturito/flutter_flow/flutter_flow_model.dart';
import 'package:flutter/material.dart';

List<Cliente> clienteFromJson(String str) =>
    List<Cliente>.from(json.decode(str).map((x) => Cliente.fromJson(x)));

class Cliente {
  int idCliente;
  String? identification;
  String? nombres;
  String? apellidos;
  String? clave;
  String? ciudad;
  String? telefono;
  String? emailCliente;
  String? user;
  String? archivoFirma;
  String? claveFirma;
  String? logo;
  DateTime? fechaRegistro;

  Cliente({
    required this.idCliente,
    this.identification,
    this.nombres,
    this.apellidos,
    this.clave,
    this.ciudad,
    this.telefono,
    this.emailCliente,
    this.user,
    this.archivoFirma,
    this.claveFirma,
    this.logo,
    this.fechaRegistro,
  });

  Cliente.withId({required this.idCliente})
      : apellidos = null,
        archivoFirma = null,
        ciudad = null,
        clave = null,
        claveFirma = null,
        emailCliente = null,
        fechaRegistro = null,
        identification = null,
        logo = null,
        nombres = null,
        telefono = null,
        user = null;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        idCliente: json["idCliente"],
        identification: json["identification"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        clave: json["clave"],
        ciudad: json["ciudad"],
        telefono: json["telefono"],
        emailCliente: json["emailCliente"],
        user: json["user"],
        archivoFirma: json["archivoFirma"],
        claveFirma: json["claveFirma"],
        logo: json["logo"],
        fechaRegistro: json["cratedAt"],
      );

  Map<String, dynamic> toJson() => {
        "idCliente": idCliente,
        "identification": identification,
        "nombres": nombres,
        "apellidos": apellidos,
        "clave": clave,
        "ciudad": ciudad,
        "telefono": telefono,
        "emailCliente": emailCliente,
        "user": user,
        "archivoFirma": archivoFirma,
        "claveFirma": claveFirma,
        "logo": logo,
        "fechaRegistro": fechaRegistro,
      };
}

class ClientesValidatorModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.
  final formKey = GlobalKey<FormState>();
  // State field(s) for txtIdentificacion widget.
  TextEditingController? razonSocial;
  String? Function(BuildContext, String?)? razonsocialControllerValidator;
  // State field(s) for txNombre widget.
  TextEditingController? identificacion;
  String? Function(BuildContext, String?)? identificacionControllerValidator;
  // State field(s) for txtCorreo widget.
  TextEditingController? direccion;
  String? Function(BuildContext, String?)? direccionControllerValidator;
  TextEditingController? telefono;
  String? Function(BuildContext, String?)? telefonoControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    razonSocial?.dispose();
    identificacion?.dispose();
    direccion?.dispose();
    telefono?.dispose();
  }

  //final unfocusNode = FocusNode();

  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  bool iuserHovered1 = false;

  bool iuserHovered2 = false;
}

class tipoAdquirienten {
  int id;
  String tipo;
  String mCurrent;
  String mUser;
  String mDate;

  tipoAdquirienten({
    required this.id,
    required this.tipo,
    required this.mCurrent,
    required this.mUser,
    required this.mDate,
  });
  factory tipoAdquirienten.fromJson(Map<String, dynamic> json) {
    return tipoAdquirienten(
      id: json['id'],
      tipo: json['tipo'],
      mCurrent: json['mCurrent'],
      mUser: json['mUser'],
      mDate: json[' mDate'],
    );
  }
}




  /// Additional helper methods are added here.




  //final unfocusNode = FocusNode();

  //TextEditingController? textController;
  //String? Function(BuildContext, String?)? textControllerValidator;

  //bool iuserHovered1 = false;

  //bool iuserHovered2 = false;



  //void initState(BuildContext context) {}

  //void dispose() {
    //unfocusNode.dispose();
    //textController?.dispose();
  //}



