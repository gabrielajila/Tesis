import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calendario_model.dart';
export 'calendario_model.dart';

class CalendarioWidget extends StatefulWidget {
  const CalendarioWidget({Key? key}) : super(key: key);

  @override
  _CalendarioWidgetState createState() => _CalendarioWidgetState();
}

class _CalendarioWidgetState extends State<CalendarioWidget> {
  late CalendarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarioModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowCalendar(
      color: Color(0xFF4A70C8),
      iconColor: FlutterFlowTheme.of(context).secondaryText,
      weekFormat: true,
      weekStartsMonday: true,
      rowHeight: 64.0,
      onChange: (DateTimeRange? newSelectedDate) {
        setState(() => _model.calendarSelectedDay = newSelectedDate);
      },
      titleStyle: FlutterFlowTheme.of(context).headlineSmall,
      dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
      dateStyle: FlutterFlowTheme.of(context).bodyMedium,
      selectedDateStyle: FlutterFlowTheme.of(context).titleSmall,
      inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
    );
  }
}
