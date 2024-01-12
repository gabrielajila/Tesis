import 'dart:convert';

List<FacturaDto> facturaDtoFromJson(String str) => List<FacturaDto>.from(json.decode(str).map((x) => FacturaDto.fromJson(x)));

String facturaDtoToJson(List<FacturaDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FacturaDto {
    int id;
    String razonSocial;
    DateTime fechaEmision;
    double total;
    String authorizacion;
    String numComprobante;

    FacturaDto({
        required this.id,
        required this.razonSocial,
        required this.fechaEmision,
        required this.total,
        required this.authorizacion,
        required this.numComprobante,
    });

    factory FacturaDto.fromJson(Map<String, dynamic> json) => FacturaDto(
        id: json["id"],
        razonSocial: json["razonSocial"],
        fechaEmision: DateTime.parse(json["fechaEmision"]),
        total: json["total"]?.toDouble(),
        authorizacion: json["authorizacion"],
        numComprobante: json["numComprobante"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "razonSocial": razonSocial,
        "fechaEmision": fechaEmision.toIso8601String(),
        "total": total,
        "authorizacion": authorizacion,
        "numComprobante": numComprobante,
    };
}
