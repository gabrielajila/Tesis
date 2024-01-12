import 'package:facturito/componentes/modal_fact_detalle/modal_fact_detalle_widget.dart';
import 'package:facturito/flutter_flow/flutter_flow_theme.dart';
import 'package:facturito/models/DTO/FacturaDTO.dart';
import 'package:flutter/material.dart';
class CustomDetal extends StatelessWidget {
  const CustomDetal({
    super.key,
    required this.fact,
  });

  final FacturaDto fact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: ModalFactDetalleWidget(),
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Icon(
                      Icons.monetization_on_rounded,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${fact.razonSocial}',
                        style: FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          '${fact.numComprobante} ${fact.fechaEmision}',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${fact.total}',
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF4A70C8),
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        'Compra',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}