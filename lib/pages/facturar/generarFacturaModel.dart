import 'package:flutter/cupertino.dart';

import '../../backend/api_requests/api_manager.dart';
import '../../flutter_flow/flutter_flow_model.dart';
import '../../flutter_flow/form_field_controller.dart';

class GenerafacturaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  var qrCodeResp = '';
  // Stores action output result for [Backend Call - API (backContFiables)] action in btnBuscar widget.
  ApiCallResponse? respuestaAdquiriente;
  ApiCallResponse? respuestaUsuario;
  ApiCallResponse? respuestaFactura;
  ApiCallResponse? respuestaPDF;
  ApiCallResponse? respuestaListaProductos;
  // State field(s) for DropDown widget.
  // State field(s) for txtIdentificacion widget.
  TextEditingController? txtIdentificacionController;
  String? Function(BuildContext, String?)? txtIdentificacionControllerValidator;
  // State field(s) for txtNombres widget.
  TextEditingController? txtNombresController;
  String? Function(BuildContext, String?)? txtNombresControllerValidator;

  TextEditingController? txtObservacionesController;
  String? Function(BuildContext, String?)? txtObservacionesControllerValidator;
  // State field(s) for txtTelefono widget.
  TextEditingController? txtTelefonoController;
  String? Function(BuildContext, String?)? txtTelefonoControllerValidator;
  // State field(s) for txtEmail widget.
  TextEditingController? txtEmailController;
  String? Function(BuildContext, String?)? txtEmailControllerValidator;
  TextEditingController? txtDescuentoController;
  String? Function(BuildContext, String?)? txtDescuentoControllerValidator;
  // State field(s) for txtDireccion widget.
  TextEditingController? txtDireccionController;
  String? Function(BuildContext, String?)? txtDireccionControllerValidator;
  // State field(s) for txtMonto widget.
  TextEditingController? txtMontoController;
  TextEditingController? txtImpuestosController;
  String? Function(BuildContext, String?)? txtImpuestosControllerValidator;
  String? Function(BuildContext, String?)? txtMontoControllerValidator;
  TextEditingController? txtEmailController2;
  String? Function(BuildContext, String?)? txtEmailController2Validator;
  String? cmbIdentificacionValue;
  FormFieldController<String>? cmbIdentificacionValueController;
  String? cmbProductoValue;
  FormFieldController<String>? cmbProductoValueController;
  // State field(s) for txtPrecioUnitario widget.
  TextEditingController? txtPrecioUnitarioController;
  String? Function(BuildContext, String?)? txtPrecioUnitarioControllerValidator;
  // State field(s) for txtPrecioUnitario widget.
  TextEditingController? txtCantidadController;
  String? Function(BuildContext, String?)? txtCantidadControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    txtIdentificacionController?.dispose();
    txtNombresController?.dispose();
    txtTelefonoController?.dispose();
    txtEmailController?.dispose();
    txtDescuentoController?.dispose();
    txtDireccionController?.dispose();
    txtMontoController?.dispose();
    txtObservacionesController?.dispose();
    txtPrecioUnitarioController?.dispose();
    txtCantidadController?.dispose();
    txtImpuestosController?.dispose();
  }
}
