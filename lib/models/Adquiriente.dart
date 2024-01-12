import 'dart:convert';

import 'package:facturito/models/TipoIdentificacion.model.dart';

List<Adquiriente> adquirienteFromJson(String str) => List<Adquiriente>.from(
    json.decode(str).map((x) => Adquiriente.fromJson(x)));

String adquirienteToJson(List<Adquiriente> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Adquiriente {
  int id;
  String razonSocial;
  String identificacion;
  String direccion;
  String telefono;
  String emailAdquiriente;
  int descuento;
  TipoIdentificacion idTipoIdentificacion;

  Adquiriente({
    required this.id,
    required this.razonSocial,
    required this.identificacion,
    required this.direccion,
    required this.telefono,
    required this.emailAdquiriente,
    required this.descuento,
    required this.idTipoIdentificacion,
  });

  Adquiriente.nuevo()
      : razonSocial = '',
        descuento = 0,
        direccion = '',
        id = 0,
        identificacion = '',
        telefono = '',
        emailAdquiriente = '',
        idTipoIdentificacion =
            TipoIdentificacion(id: 0, codigo: '', tipoIdentificacion: '');

  factory Adquiriente.fromJson(Map<String, dynamic> json) => Adquiriente(
        id: json["id"],
        razonSocial: json["razonSocial"],
        identificacion: json["identificacion"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        emailAdquiriente: json["emailAdquiriente"],
        descuento: json["descuento"],
        idTipoIdentificacion:
            TipoIdentificacion.fromJson(json["idTipoIdentificacion"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "razonSocial": razonSocial,
        "identificacion": identificacion,
        "direccion": direccion,
        "telefono": telefono,
        "emailAdquiriente": emailAdquiriente,
        "descuento": descuento,
        "idTipoIdentificacion": idTipoIdentificacion.toJson()
      };
}
