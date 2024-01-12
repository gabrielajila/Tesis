import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CalendarioModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  DateTime? fechaIni;

  DateTime? fechafin;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
