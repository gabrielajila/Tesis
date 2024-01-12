import 'dart:convert';

List<TipoIdentificacion> tipoIdentificacionFromJson(String str) =>
    List<TipoIdentificacion>.from(
        json.decode(str).map((x) => TipoIdentificacion.fromJson(x)));

String tipoIdentificacionToJson(List<TipoIdentificacion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TipoIdentificacion {
  int id;
  String codigo;
  String tipoIdentificacion;

  TipoIdentificacion({
    required this.id,
    required this.codigo,
    required this.tipoIdentificacion,
  });

  factory TipoIdentificacion.fromJson(Map<String, dynamic> json) =>
      TipoIdentificacion(
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
