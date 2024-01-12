import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:modern_form_esys_flutter_share/modern_form_esys_flutter_share.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'visualizacion_p_d_f_model.dart';
export 'visualizacion_p_d_f_model.dart';

class VisualizacionPDFWidget extends StatefulWidget {
  const VisualizacionPDFWidget({Key? key}) : super(key: key);

  @override
  _VisualizacionPDFWidgetState createState() => _VisualizacionPDFWidgetState();
}

class _VisualizacionPDFWidgetState extends State<VisualizacionPDFWidget> {
  late VisualizacionPDFModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print('object ${FFAppState().pathBytes}');
    _model = createModel(context, () => VisualizacionPDFModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
        appBar: AppBar(
          backgroundColor: Color(0xFF4A70C8),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
          
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PDFView(
                pdfData: FFAppState().pathBytes,
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: false,
                pageFling: true,
                pageSnap: true,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
