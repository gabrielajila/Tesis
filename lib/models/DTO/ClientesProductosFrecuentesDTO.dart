import 'dart:convert';

List<ClientesFrecuentesDto> clientesFrecuentesDtoFromJson(String str) => List<ClientesFrecuentesDto>.from(json.decode(str).map((x) => ClientesFrecuentesDto.fromJson(x)));

String clientesFrecuentesDtoToJson(List<ClientesFrecuentesDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientesFrecuentesDto {
    String nombre;
    int cantidad;

    ClientesFrecuentesDto({
        required this.nombre,
        required this.cantidad,
    });

    factory ClientesFrecuentesDto.fromJson(Map<String, dynamic> json) => ClientesFrecuentesDto(
        nombre: json["nombre"],
        cantidad: json["cantidad"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "cantidad": cantidad,
    };
}
