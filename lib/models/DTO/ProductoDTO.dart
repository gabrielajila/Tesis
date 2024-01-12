class ProductoDTO {
  int id;
  String codigo;
  String nombreProducto;
  double precioUnitario;
  String informacionAdicional;
  int tarifaIva;
  int idCliente;

  ProductoDTO({
    required this.id,
    required this.codigo,
    required this.nombreProducto,
    required this.precioUnitario,
    required this.informacionAdicional,
    required this.idCliente,
    required this.tarifaIva,
  });
}
