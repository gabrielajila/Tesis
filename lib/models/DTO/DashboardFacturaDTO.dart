import 'dart:convert';

List<DashboardFacturaDto> dashboardFacturaDtoFromJson(String str) => List<DashboardFacturaDto>.from(json.decode(str).map((x) => DashboardFacturaDto.fromJson(x)));

String dashboardFacturaDtoToJson(List<DashboardFacturaDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DashboardFacturaDto {
    int anio;
    int mes;
    int cantidad;

    DashboardFacturaDto({
        required this.anio,
        required this.mes,
        required this.cantidad,
    });

    factory DashboardFacturaDto.fromJson(Map<String, dynamic> json) => DashboardFacturaDto(
        anio: json["anio"],
        mes: json["mes"],
        cantidad: json["cantidad"],
    );

    Map<String, dynamic> toJson() => {
        "anio": anio,
        "mes": mes,
        "cantidad": cantidad,
    };
}