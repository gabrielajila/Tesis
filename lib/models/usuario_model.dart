import 'package:json_path/fun_extra.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    int idUsuario;
    String identification;
    String nombres;
    String apellidos;
    String clave;
    String ciudad;
    String telefono;
    IdTipoIdentificacion idTipoIdentificacion;
    String emailUsuario;
    String user;
    String archivoFirma;
    dynamic claveFirma;
    dynamic logo;
    DateTime fechaRegistro;

    Usuario({
        required this.idUsuario,
        required this.identification,
        required this.nombres,
        required this.apellidos,
        required this.clave,
        required this.ciudad,
        required this.telefono,
        required this.idTipoIdentificacion,
        required this.emailUsuario,
        required this.user,
        required this.archivoFirma,
        required this.claveFirma,
        required this.logo,
        required this.fechaRegistro,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["idCliente"],
        identification: json["identification"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        clave: json["clave"],
        ciudad: json["ciudad"],
        telefono: json["telefono"],
        idTipoIdentificacion: IdTipoIdentificacion.fromJson(json["idTipoIdentificacion"]),
        emailUsuario: json["emailCliente"],
        user: json["user"],
        archivoFirma: json["archivoFirma"],
        claveFirma: json["claveFirma"],
        logo: json["logo"],
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
    );

    Map<String, dynamic> toJson() => {
        "idCliente": idUsuario,
        "identification": identification,
        "nombres": nombres,
        "apellidos": apellidos,
        "clave": clave,
        "ciudad": ciudad,
        "telefono": telefono,
        "idTipoIdentificacion": idTipoIdentificacion.toJson(),
        "emailCliente": emailUsuario,
        "user": user,
        "archivoFirma": archivoFirma,
        "claveFirma": claveFirma,
        "logo": logo,
        "fechaRegistro": fechaRegistro.toIso8601String(),
    };
}

class IdTipoIdentificacion {
    int id;
    String codigo;
    String tipoIdentificacion;

    IdTipoIdentificacion({
        required this.id,
        required this.codigo,
        required this.tipoIdentificacion,
    });

    factory IdTipoIdentificacion.fromJson(Map<String, dynamic> json) => IdTipoIdentificacion(
        id: json["id"],
        codigo: json["codigo"],
        tipoIdentificacion: json["tipoIdentificacion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "tipoIdentificacion": tipoIdentificacion,
    };
}



class RegistrarModel extends FlutterFlowModel {
  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // State field(s) for TextField widget.
  TextEditingController? identification;
  String? Function(BuildContext, String?)? identificationController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? nombres;
  String? Function(BuildContext, String?)? nombresController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? apellidos;
  String? Function(BuildContext, String?)? apellidosController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? emailUsuario;
  String? Function(BuildContext, String?)? emailUsuarioController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? ciudad;
  String? Function(BuildContext, String?)? ciudadController5Validator;
  // State field(s) for TextField widget.
  TextEditingController? telefono;
  String? Function(BuildContext, String?)? telefonoController6Validator;
  // State field(s) for TextField widget.
  TextEditingController? user;
  String? Function(BuildContext, String?)? userController7Validator;
  // State field(s) for TextField widget.
  TextEditingController? clave;
  String? Function(BuildContext, String?)? claveController8Validator;
  // State field(s) for TextField widget.
  TextEditingController? claveFirma;
  String? Function(BuildContext, String?)? claveFirmaController9Validator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    identification?.dispose();
    nombres?.dispose();
    apellidos?.dispose();
    emailUsuario?.dispose();
    ciudad?.dispose();
    telefono?.dispose();
    user?.dispose();
    clave?.dispose();
    claveFirma?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
