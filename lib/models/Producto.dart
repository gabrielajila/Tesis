import 'dart:convert';

import 'package:facturito/models/cliente.dart';

List<Producto> productoFromJson(String str) =>
    List<Producto>.from(json.decode(str).map((x) => Producto.fromJson(x)));

List<TarifaIva> tarifaIvaFromJson(String str) =>
    List<TarifaIva>.from(json.decode(str).map((x) => TarifaIva.fromJson(x)));

String productoToJson(List<Producto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producto {
  int id;
  String codigo;
  String nombreProducto;
  double precioUnitario;
  String informacionAdicional;
  TarifaIva? tarifaIva;
  dynamic idCodigoIce;
  Cliente? cliente;
  bool activo;

  Producto({
    required this.id,
    required this.codigo,
    required this.nombreProducto,
    required this.precioUnitario,
    required this.informacionAdicional,
    this.tarifaIva,
    this.idCodigoIce,
    this.cliente,
    required this.activo,
  });

  Producto.empty()
      : activo = true,
        cliente = null,
        codigo = '',
        id = 0,
        idCodigoIce = null,
        informacionAdicional = '',
        nombreProducto = '',
        precioUnitario = 0,
        tarifaIva = null;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        codigo: json["codigo"],
        nombreProducto: json["nombreProducto"],
        precioUnitario: json["precioUnitario"]?.toDouble(),
        informacionAdicional: json["informacionAdicional"] ?? '',
        tarifaIva: TarifaIva.fromJson(json["idTarifaIva"]),
        idCodigoIce: json["idCodigoIce"],
        cliente: Cliente.fromJson(json["cliente"]),
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "nombreProducto": nombreProducto,
        "precioUnitario": precioUnitario,
        "informacionAdicional": informacionAdicional,
        "idTarifaIva": tarifaIva,
        "idCodigoIce": idCodigoIce,
        "cliente": cliente?.toJson(),
        "activo": activo,
      };
}

class TarifaIva {
  int idTarifaIva;
  String descripcion;
  int porcentaje;
  String codigoSri;

  TarifaIva({
    required this.idTarifaIva,
    required this.descripcion,
    required this.porcentaje,
    required this.codigoSri,
  });

  factory TarifaIva.fromJson(Map<String, dynamic> json) => TarifaIva(
        idTarifaIva: json["idTarifaIva"],
        descripcion: json["descripcion"],
        porcentaje: json["porcentaje"],
        codigoSri: json["codigoSri"],
      );

  Map<String, dynamic> toJson() => {
        "idTarifaIva": idTarifaIva,
        "descripcion": descripcion,
        "porcentaje": porcentaje,
        "codigoSri": codigoSri,
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

  factory IdTipoIdentificacion.fromJson(Map<String, dynamic> json) =>
      IdTipoIdentificacion(
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
