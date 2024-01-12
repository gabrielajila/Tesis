import 'dart:convert';

import 'package:facturito/app_state.dart';
import 'package:facturito/backend/api_requests/api_calls.dart';
import 'package:facturito/models/DTO/FacturaDTO.dart';
import 'package:facturito/shared/customSnackBar.dart';
import 'package:facturito/shared/sales/ItemFacturas.dart';
import 'package:flutter/material.dart';

class FacturasEmitidas extends StatelessWidget {
  const FacturasEmitidas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: GenerarFacturaCall.obtenerFacturasPorFecha(
            idCliente: FFAppState().idCliente,
            fechaInicio: DateTime.now(),
            fechaFinal: DateTime.now()),
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<FacturaDto> facturasEmitidas = [];

          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          try {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final resp = snapshot.data;
                facturasEmitidas = facturaDtoFromJson(json.encode(resp.jsonBody));
                return ListView.builder(
                  itemCount: facturasEmitidas.length,
                  itemBuilder: (BuildContext context, int index) {
                    FacturaDto fact=facturasEmitidas[index];
                    return CustomDetal(fact: fact);
                  },
                );
              }
            }
          } catch (e) {
            customSnackBar(context, 'Error al obtener las facturas');
          }
          return Center(child: Text('NO DATA'));
        },
      ),
    );
  }
}
