import 'dart:convert';

import '../backend/api_requests/api_manager.dart';

class DecodeUTF8 {
  static List<dynamic> decodeList(ApiCallResponse response) {
    String value = utf8.decode(response.bodyText.codeUnits);
    return jsonDecode(value);
  }

  static String decodeString(ApiCallResponse response) {
    String value = utf8.decode(response.bodyText.codeUnits);
    return value;
  }
}
