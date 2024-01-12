import '../../shared/mascaras.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class RegisterModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.
  ApiCallResponse? respuestaRegistro;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  // State field(s) for txtIdentificacion widget.
  TextEditingController? txtIdentificacionController;
  final txtIdentificacionMask = MaskTextInputFormatter(mask: '#############');
  String? Function(BuildContext, String?)? txtIdentificacionControllerValidator;
  // State field(s) for txtNombres widget.
  TextEditingController? txtNombresController;
  String? Function(BuildContext, String?)? txtNombresControllerValidator;
  // State field(s) for txtApellidos widget.
  TextEditingController? txtApellidosController;
  String? Function(BuildContext, String?)? txtApellidosControllerValidator;
  // State field(s) for txtCorreoElectronico widget.
  TextEditingController? txtCorreoElectronicoController;
  String? Function(BuildContext, String?)?
      txtCorreoElectronicoControllerValidator;
  // State field(s) for DropDown_Ciudad widget.
  String? dropDownCiudadValue;
  FormFieldController<String>? dropDownCiudadValueController;
  // State field(s) for txtTelefono widget.
  TextEditingController? txtTelefonoController;
  String? Function(BuildContext, String?)? txtTelefonoControllerValidator;
  // State field(s) for txtUsuario widget.
  TextEditingController? txtUsuarioController;
  String? Function(BuildContext, String?)? txtUsuarioControllerValidator;
  // State field(s) for txtClave widget.
  TextEditingController? txtClaveController;
  late bool txtClaveVisibility;
  String? Function(BuildContext, String?)? txtClaveControllerValidator;
  // State field(s) for txtPassword widget.
  TextEditingController? txtPasswordController;
  late bool txtPasswordVisibility;
  String? Function(BuildContext, String?)? txtPasswordControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    txtClaveVisibility = false;
    txtPasswordVisibility = false;
  }

  void dispose() {
    txtIdentificacionController?.dispose();
    txtNombresController?.dispose();
    txtApellidosController?.dispose();
    txtCorreoElectronicoController?.dispose();
    txtTelefonoController?.dispose();
    txtUsuarioController?.dispose();
    txtClaveController?.dispose();
    txtPasswordController?.dispose();
  }
}
