import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'add_calendar_widget.dart' show AddCalendarWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCalendarModel extends FlutterFlowModel<AddCalendarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtSubject widget.
  FocusNode? txtSubjectFocusNode;
  TextEditingController? txtSubjectTextController;
  String? Function(BuildContext, String?)? txtSubjectTextControllerValidator;
  // State field(s) for txtBody widget.
  FocusNode? txtBodyFocusNode;
  TextEditingController? txtBodyTextController;
  String? Function(BuildContext, String?)? txtBodyTextControllerValidator;
  // Stores action output result for [Custom Action - evenToJson] action in Button widget.
  dynamic? createdEvent;
  // Stores action output result for [Custom Action - signInWithGoogle] action in Button widget.
  String? accessToken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtSubjectFocusNode?.dispose();
    txtSubjectTextController?.dispose();

    txtBodyFocusNode?.dispose();
    txtBodyTextController?.dispose();
  }
}
