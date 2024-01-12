import 'package:facturito/componentes/p_d_f_fact/pdf_view.dart';
import 'package:facturito/componentes/p_d_f_fact/pdf_view_model.dart';
import 'package:facturito/componentes/p_d_f_fact/share.dart';
import 'package:flutter/services.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PDFviewWidget extends StatefulWidget {
  const PDFviewWidget({Key? key}) : super(key: key);

  @override
  _PDFviewWidgetState createState() => _PDFviewWidgetState();
}

class _PDFviewWidgetState extends State<PDFviewWidget> {
  late PDFviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDFviewModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  Future<void> _sharePdf(Uint8List list) async {
    try {
      await Share.file('${FFAppState().numeroAutorizacion}',
          '${FFAppState().numeroAutorizacion}.pdf', list, "application/pdf",
          text: 'My optional text.');
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _sharePdf(FFAppState().pathBytes);
          },
          backgroundColor: Color(0xFF57636C),
          elevation: 8,
          label: Container(
              child: Text(
            'Compartir',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
          )),
        ),
        body: SafeArea(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: PDFView(
                pdfData: FFAppState().pathBytes,
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: false,
                pageFling: true,
                pageSnap: true,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
