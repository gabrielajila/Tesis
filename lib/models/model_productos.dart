class ProductoModel {
  int id;
  String codigo;
  String nombreProducto;
  double precioUnitario;
  String informacionAdicional;
  TarifaIva idTarifaIva;

  ProductoModel({
    required this.id,
    required this.codigo,
    required this.nombreProducto,
    required this.precioUnitario,
    required this.informacionAdicional,
    required this.idTarifaIva,
  });

  ProductoModel.empty({required this.id})
      : codigo = '',
        informacionAdicional = '',
        nombreProducto = '',
        precioUnitario = 0,
        idTarifaIva = TarifaIva(
            idTarifaIva: 0, descripcion: '', porcentaje: 0, codigoSri: '');

  factory ProductoModel.fromJson(Map<String, dynamic> json) {
    return ProductoModel(
      id: json['id'],
      codigo: json['codigo'],
      nombreProducto: json['nombreProducto'],
      precioUnitario: json['precioUnitario'].toDouble(),
      informacionAdicional: json['informacionAdicional'],
      idTarifaIva: TarifaIva.fromJson(json['idTarifaIva']),
    );
  }
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

  factory TarifaIva.fromJson(Map<String, dynamic> json) {
    return TarifaIva(
      idTarifaIva: json['idTarifaIva'],
      descripcion: json['descripcion'],
      porcentaje: json['porcentaje'],
      codigoSri: json['codigoSri'],
    );
  }
}
