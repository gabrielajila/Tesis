import 'dart:convert';

RespSimple welcomeFromJson(String str) => RespSimple.fromJson(json.decode(str));

String welcomeToJson(RespSimple data) => json.encode(data.toJson());

class RespSimple {
  String? error;
  String mensaje;
  String? parametroRespuesta;
  String codigo;
  String? descripcion;
  dynamic data;

  RespSimple({
    this.error,
    required this.mensaje,
    this.parametroRespuesta,
    required this.codigo,
    this.descripcion,
    this.data,
  });

  factory RespSimple.fromJson(Map<String, dynamic> json) => RespSimple(
        error: json["error"],
        mensaje: json["mensaje"],
        parametroRespuesta: json["parametroRespuesta"],
        codigo: json["codigo"],
        descripcion: json["descripcion"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "mensaje": mensaje,
        "parametroRespuesta": parametroRespuesta,
        "codigo": codigo,
        "descripcion": descripcion,
        "data": data,
      };

  static RespSimple trasformarRespuesta(dynamic response) {
    // print(response);
    RespSimple respSimple = RespSimple(
        error: "Error",
        mensaje: "Error al procesar la respuesta",
        parametroRespuesta: "",
        codigo: "1",
        descripcion: "",
        data: null);
    try {
      if (response != '') {
        Map<String, dynamic> mapResponse = json.decode(response);
        respSimple = RespSimple.fromJson(mapResponse);
        respSimple.mensaje = utf8.decode(respSimple.mensaje.codeUnits);
        return respSimple;
      }
      return respSimple;
    } catch (e) {
      print(e);
      return respSimple;
    }
  }
}
