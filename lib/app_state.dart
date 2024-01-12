import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  static void reset() {
    _instance = FFAppState._internal();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _user = prefs.getString('ff_user') ?? _user;
    });
    _safeInit(() {
      _password = prefs.getString('ff_password') ?? _password;
    });
    _safeInit(() {
      _idCliente = prefs.getInt('ff_idCliente') ?? _idCliente;
    });
  }

  late SharedPreferences prefs;

  int _idCliente = 1;
  int get idCliente => _idCliente;
  set idCliente(int _value) {
    _idCliente = _value;
    prefs.setInt('ff_idCliente', _idCliente);
  }

  String _emailUsuario = 'marcatoma99@gmail.com';
  String get emailUsuario => _emailUsuario;
  set emailUsuario(String _value) {
    _emailUsuario = _value;
  }

  String _jsonProductos = '';
  String get jsonProductos => _jsonProductos;
  set jsonProductos(String _value) {
    _jsonProductos = _value;
  }

  String _codeQr = '';
  String get codeQr => _codeQr;
  set codeQr(String _value) {
    _codeQr = _value;
  }

  String _numeroAutorizacion = '';
  String get numeroAutorizacion => _numeroAutorizacion;
  set numeroAutorizacion(String _value) {
    _numeroAutorizacion = _value;
  }

  late Uint8List _pathBytes;
  Uint8List get pathBytes => _pathBytes;
  set pathBytes(Uint8List _value) {
    _pathBytes = _value;
  }

  String _idPuntoEmision = '0';
  String get idPuntoEmision => _idPuntoEmision;
  set idPuntoEmision(String _value) {
    _idPuntoEmision = _value;
  }

  String _user = '';
  String get user => _user;
  set user(String _value) {
    _user = _value;
    prefs.setString('ff_user', _value);
  }

  String _password = '';
  String get password => _password;
  set password(String _value) {
    _password = _value;
    prefs.setString('ff_password', _value);
  }

  String _identificacion = '';
  String get identificacion => _identificacion;
  set identificacion(String _value) {
    _identificacion = _value;
  }

  String _ruc = '';
  String get ruc => _ruc;
  set ruc(String _value) {
    _ruc = _value;
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
  }

  String _direccion = '';
  String get direccion => _direccion;
  set direccion(String _value) {
    _direccion = _value;
  }

  String _telefono = '';
  String get telefono => _telefono;
  set telefono(String _value) {
    _telefono = _value;
  }

  String _correo = '';
  String get correo => _correo;
  set correo(String _value) {
    _correo = _value;
  }

  String _razonSocial = '';
  String get razonSocial => _razonSocial;
  set razonSocial(String _value) {
    _razonSocial = _value;
  }

  String _qr = '';
  String get qr => _qr;
  set qr(String _value) {
    _qr = _value;
  }

  String _monto = '';
  String get monto => _monto;
  set monto(String _value) {
    _monto = _value;
  }

  String _identificacionA = '';
  String get identificacionA => _identificacionA;
  set identificacionA(String _value) {
    _identificacionA = _value;
  }

  String _descuentoA = '';
  String get descuentoA => _descuentoA;
  set descuentoA(String _value) {
    _descuentoA = _value;
  }

  String _tipoIdentificacionA = '';
  String get tipoIdentificacionA => _tipoIdentificacionA;
  set tipoIdentificacionA(String _value) {
    _tipoIdentificacionA = _value;
  }

  String _direccionA = '';
  String get direccionA => _direccionA;
  set direccionA(String _value) {
    _direccionA = _value;
  }

  String _telefonoA = '';
  String get telefonoA => _telefonoA;
  set telefonoA(String _value) {
    _telefonoA = _value;
  }

  String _correoA = '';
  String get correoA => _correoA;
  set correoA(String _value) {
    _correoA = _value;
  }

  String _razonSocialA = '';
  String get razonSocialA => _razonSocialA;
  set razonSocialA(String _value) {
    _razonSocialA = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
