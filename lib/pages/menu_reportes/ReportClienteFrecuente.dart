import 'package:facturito/models/DTO/ClientesProductosFrecuentesDTO.dart';
import 'package:flutter/material.dart';

class ReportClienteFrecuentes extends StatelessWidget {
  const ReportClienteFrecuentes({super.key, required this.listaClientes});
  final List<ClientesFrecuentesDto> listaClientes;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
          columns: [
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Cantidad')),
          ],
          rows: listaClientes.map((item) => DataRow(cells: [
                DataCell(Text(item.nombre)),
                DataCell(Text(item.cantidad.toString())),
              ])).toList(),
        ),
    );
  }
}