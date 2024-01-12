class ProductoAux {
  int id_producto;
  String codigo;
  String descripcion;
  double cantidad;
  double valorIce;
  double valor;
  int codigoIva;

  ProductoAux({
    required this.id_producto,
    required this.codigo,
    required this.descripcion,
    required this.cantidad,
    required this.valorIce,
    required this.valor,
    required this.codigoIva,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_producto': id_producto,
      'codigo': codigo,
      'descripcion': descripcion,
      'cantidad': cantidad,
      "valorIce": valorIce,
      'valor': valor,
      'codigoIva': codigoIva
    };
  }
}
