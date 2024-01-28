import 'dart:convert';

import 'package:facturito/enviroments.dart';
import 'package:facturito/flutter_flow/flutter_flow_util.dart';
import 'package:facturito/models/DTO/ProductoDTO.dart';
import 'api_manager.dart';
export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class EstablecimientoCall {
  static Future<ApiCallResponse> obtenerEstablecimientos({
    dynamic idCliente = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesGetEstablecimientos',
      apiUrl: '${Enviroments.endpoint}/puntoVenta/getEstablecimientos',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'idCliente': idCliente,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class Dashboard {
  static Future<ApiCallResponse> getFacturasByMonth({required int idCliente}) {
    return ApiManager.instance.makeApiCall(
      callName: 'getFacturasByMonth',
      apiUrl: '${Enviroments.endpoint}/dashboard/getFacturasByMonth',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idCliente": idCliente},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

    static Future<ApiCallResponse> getClientesFrecuentes({required int idCliente}) {
    return ApiManager.instance.makeApiCall(
      callName: 'getClientesFrecuentes',
      apiUrl: '${Enviroments.endpoint}/dashboard/getClientesFrecuentes',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idCliente": idCliente},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

      static Future<ApiCallResponse> getProductosFrecuentes({required int idCliente}) {
    return ApiManager.instance.makeApiCall(
      callName: 'getProductosFrecuentes',
      apiUrl: '${Enviroments.endpoint}/dashboard/getProductosFrecuentes',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idCliente": idCliente},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class PuntoEmisionCall {
  static Future<ApiCallResponse> obtenerPuntosEmision({
    dynamic idEstablecimiento = 0,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesGetPuntosEmision',
      apiUrl: '${Enviroments.endpoint}/puntoVenta/getPuntosVenta',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'idEstablecimiento': idEstablecimiento,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class ChatbotCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Chatbot',
      apiUrl: 'http://localhost:3000/ask',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class ProductoApiCall {
  static Future<ApiCallResponse> guardarProducto(ProductoDTO producto) {
    return ApiManager.instance.makeApiCall(
      //aqui hay un ejemplo de como debemos poner los apicall para que funcione, el api call de guardarAdquiriente
      callName: 'guardarProducto',
      apiUrl:
          '${Enviroments.endpoint}/producto/guardarProducto', //hay que cambiar la ip cada cambio de red
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: '''{
        "codigo": "${producto.codigo}",
        "nombreProducto": "${producto.nombreProducto}",
        "informacionAdicional": "${producto.informacionAdicional}",
        "precioUnitario": ${producto.precioUnitario},
        "idTarifaIva": {
          "idTarifaIva": ${producto.tarifaIva}
        },
        "cliente": {
          "idCliente": ${producto.idCliente}
        }
      }''',
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerListaIva() {
    return ApiManager.instance.makeApiCall(
      callName: 'obtenerListaIva',
      apiUrl: '${Enviroments.endpoint}/producto/listaIva',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerListaProductos(int idCliente) {
    return ApiManager.instance.makeApiCall(
      callName: 'obtenerListaProductos',
      apiUrl: '${Enviroments.endpoint}/producto/list',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {'idCliente': idCliente, 'idProducto': 0},
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> registrarProducto(
      Map<String, dynamic> producto) {
    return ApiManager.instance.makeApiCall(
      callName: 'registrarProducto',
      apiUrl: '${Enviroments.endpoint}/producto/guardarProducto',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: jsonEncode(producto),
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class GenerarFacturaCall {

  static Future<ApiCallResponse> reenviarFacturaById({
    required int idFactura,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'reenviarFacturabyIdFactura',
      apiUrl:
          '${Enviroments.endpoint}/factura/reenviarFacturabyIdFactura',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idFactura": idFactura},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> reenviarFacturaPorCorreo({
    required int idFactura,
    required correoAdquiriente,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'reenviarFacturaPorCorreo',
      apiUrl:
          '${Enviroments.endpoint}/factura/reenviarFacturaPorCorreo',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idFactura": idFactura, "correo": correoAdquiriente},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> enviarFacturaByAutorizacion({
    String? numAutorizacion = '',
    String? correoAdquiriente = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesEnviarFacturaPorCorreoByNumAut',
      apiUrl:
          '${Enviroments.endpoint}/factura/movil/reenviarFacturaPorCorreoByNumAut',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"numAutorizacion": numAutorizacion, "correo": correoAdquiriente},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerFacturasPorFecha(
      {required int idCliente,
      required DateTime fechaInicio,
      required DateTime fechaFinal}) {
    return ApiManager.instance.makeApiCall(
      callName: 'obtenerFacturasPorFecha',
      apiUrl: '${Enviroments.endpoint}/factura/obtenerFacturasPorFecha',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        "idCliente": idCliente,
        "fechaInicio": fechaInicio,
        "fechaFinal": fechaFinal
      },
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerUltimas3Facturas({
    required int idCliente,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'obtenerUltimas3Facturas',
      apiUrl: '${Enviroments.endpoint}/factura/obtenerUltimas3Facturas',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idCliente": idCliente},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> generarFacturaPDF({
    String? numeroAutorizacion = '',
  }) {
    print('${Enviroments.endpointSRI}/getPDF/$numeroAutorizacion');
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesGenerarPDF',
      apiUrl: '${Enviroments.endpointSRI}/getPDF/$numeroAutorizacion',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/pdf',
      },
      params: {},
      body: null,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> buscarAdquiriente({
    String? identificacion = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesBuscarAdquiriente',
      apiUrl: '${Enviroments.endpoint}/adquiriente/getAdquiriente',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"identificacion": identificacion},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerListaTipoIdentificacion() {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesListaTipoIdentificacion',
      apiUrl: '${Enviroments.endpoint}/adquiriente/listaTiposIdentificacion',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: null,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> facturar(
      {String? ruc = '',
      String? identificacionComprador = '',
      String? razonSocialComprador = '',
      String? direccionComprador = '',
      String? telefonoComprador = '',
      String? emailComprador = '',
      String? observaciones = '',
      dynamic descuentoComprador = 0,
      String? codigoIdentificacion,
      required String numComprobante,
      required dynamic idPuntoEmision,
      dynamic lstDetalle}) {
    print('''
{
    "ruc": "$ruc",
    "numComprobante": "$numComprobante",
    "identificacionComprador": "$identificacionComprador",
    "razonSocialComprador": "$razonSocialComprador",
    "direccionComprador": "$direccionComprador",
    "telefonoComprador": "$telefonoComprador",
    "emailComprador": "$emailComprador",
    "descuentoComprador": $descuentoComprador,
    "codigoIdentificacion": "$codigoIdentificacion",
    "observacionesComprador": "$observaciones",
    "lstDetalle": $lstDetalle,
    "idPuntoVenta": $idPuntoEmision
}
''');
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesFacturar',
      apiUrl: '${Enviroments.endpoint}/factura/facturar',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: '''
{
    "ruc": "$ruc",
    "numComprobante": "$numComprobante",
    "identificacionComprador": "$identificacionComprador",
    "razonSocialComprador": "$razonSocialComprador",
    "direccionComprador": "$direccionComprador",
    "telefonoComprador": "$telefonoComprador",
    "emailComprador": "$emailComprador",
    "descuentoComprador": $descuentoComprador,
    "codigoIdentificacion": "$codigoIdentificacion",
    "observacionesComprador": "$observaciones",
    "lstDetalle": $lstDetalle,
    "idPuntoVenta": $idPuntoEmision
}
''',
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static dynamic comprobante(dynamic response) => getJsonField(
        response,
        r'''$.data.comprobante''',
      );

  static dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.codigo''',
      );

  static dynamic numeroAutorizacion(dynamic response) => getJsonField(
        response,
        r'''$.data.numeroAutorizacion''',
      );

  static dynamic razonSocial(dynamic response) => getJsonField(
        response,
        r'''$.razonSocial''',
      );
  static dynamic identification(dynamic response) => getJsonField(
        response,
        r'''$.identificacion''',
      );
  static dynamic direccion(dynamic response) => getJsonField(
        response,
        r'''$.direccion''',
      );
  static dynamic telefono(dynamic response) => getJsonField(
        response,
        r'''$.telefono''',
      );
  static dynamic emailAdquiriente(dynamic response) => getJsonField(
        response,
        r'''$.emailAdquiriente''',
      );

  static dynamic descuentoAdquiriente(dynamic response) => getJsonField(
        response,
        r'''$.descuento''',
      );

  static dynamic tipoIdentificacionAdquiriente(dynamic response) =>
      getJsonField(
        response,
        r'''$.idTipoIdentificacion.codigo''',
      );
}

class Usuario {
  static Future<ApiCallResponse> login(String usuario, String password) {
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${Enviroments.endpoint}/auth/authenticate',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: '''
{
    "username":"$usuario",
    "password":"$password"
}
''',
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> buscarIdentificacionUsuario({
    String? usuario = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesIdentificacionUsuario',
      apiUrl: '${Enviroments.endpoint}/getIdentificacionUsuario',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"usuario": usuario},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class RegistroCall {
  static Future<ApiCallResponse> guardarClienteCall(
      {String? file64 = '',
      String? identificacion = '',
      String? password = '',
      String? nombres = '',
      String? apellidos = '',
      String? clave = '',
      String? ciudad = '',
      String? telefono = '',
      int? idTipoIdentificacion = 0,
      String? emailCliente = '',
      String? user = '',
      String? logo = ''}) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesRegistro',
      apiUrl: '${Enviroments.endpoint}/auth/registro',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: '''
{
  "file64": "$file64",
  "logo64": "$logo",
  "password": "$password",
  "cliente": {
    "identification": "$identificacion",
    "nombres": "$nombres",
    "apellidos": "$apellidos",
    "clave": "$clave",
    "ciudad": "$ciudad",
    "telefono": "$telefono",
    "idTipoIdentificacion": {"id": "$idTipoIdentificacion"},
    "emailCliente": "$emailCliente",
    "versionContfiables": {"id": 1},
    "user": "$user",
    "password": "$password"
  }
}
''',
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class ProductosCall {
  static Future<ApiCallResponse> obtenerIdIva(idProducto) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesObtenerIdIva',
      apiUrl: '${Enviroments.endpoint}/producto/producto/idIva',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idProducto": idProducto},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerIvaProducto(idProducto) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesObtenerPrecioProducto',
      apiUrl: '${Enviroments.endpoint}/producto/producto/iva',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idProducto": idProducto},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerNombreProducto(idProducto) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesObtenerNombreProducto',
      apiUrl: '${Enviroments.endpoint}/producto/producto/nombre',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idProducto": idProducto},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerCodigoProducto(idProducto) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesObtenerNombreProducto',
      apiUrl: '${Enviroments.endpoint}/producto/producto/codigo',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idProducto": idProducto},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerMontoProducto(
      {double? precio, double? iva, double? descuento}) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesObtenerMontoProducto',
      apiUrl: '${Enviroments.endpoint}/producto/producto/calcularMonto',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"precio": precio, "iva": iva, "descuento": descuento},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerListaProductos(
      {idCliente, idProducto}) {
    return ApiManager.instance.makeApiCall(
      callName: 'backContFiablesObtenerProdcutos',
      apiUrl: '${Enviroments.endpoint}/producto/list',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {"idCliente": idCliente, "idProducto": idProducto},
      body: null,
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
    );
  }
}

class AdquirienteCall {
  static Future<ApiCallResponse> guarAdquiriente({
    required String identificacion,
    String? nombre,
    String? correo,
    String? telefono,
    String? direccion,
  }) {
    return ApiManager.instance.makeApiCall(
      //aqui hay un ejemplo de como debemos poner los apicall para que funcione, el api call de guardarAdquiriente
      callName: 'GuardarAdquiriente',
      apiUrl:
          '${Enviroments.endpoint}/adquiriente/guardarAdquiriente', //hay que cambiar la ip cada cambio de red
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: '''{
        "identificacion": "$identificacion",
        "razonSocial": "$nombre",
        "emailAdquiriente": "$correo",
        "telefono": "$telefono",
        "direccion": "$direccion",
        "descuento":0,
        "idTipoIdentificacion": {
          "id": 2
        }
      }''',
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerListaTipoIdentificacion() {
    return ApiManager.instance.makeApiCall(
      callName: 'obtenerListaTipoIdentificacion',
      apiUrl: '${Enviroments.endpoint}/adquiriente/listaTiposIdentificacion',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> obtenerListaAdquirientes() {
    return ApiManager.instance.makeApiCall(
      callName: 'ObtenerListaAdquiriente',
      apiUrl: '${Enviroments.endpoint}/adquiriente/listarAdquiriente',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }

  static Future<ApiCallResponse> registrarAdquirientes(
      Map<String, dynamic> cliente) {
    print('id: $cliente');
    return ApiManager.instance.makeApiCall(
      callName: 'registrarAdquirientes',
      apiUrl: '${Enviroments.endpoint}/adquiriente/guardarAdquiriente',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: jsonEncode(cliente),
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
    );
  }
}

// class GuardarUsuario{
//   static Future<ApiCallResponse> guardarUsuario({
// required String identificacion,
// String? nombre,
// String? apellido,
// String? correo,
// String? ciudad,
// String? telefono,
// String? usuario,
// String? password,
// String? clave,

//   })
// }

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
