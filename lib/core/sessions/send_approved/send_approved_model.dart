import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'send_approved_widget.dart' show SendApprovedWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SendApprovedModel extends FlutterFlowModel<SendApprovedWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  // State field(s) for txtSubject widget.
  FocusNode? txtSubjectFocusNode;
  TextEditingController? txtSubjectTextController;
  String? Function(BuildContext, String?)? txtSubjectTextControllerValidator;
  // State field(s) for txtBody widget.
  FocusNode? txtBodyFocusNode;
  TextEditingController? txtBodyTextController;
  String? Function(BuildContext, String?)? txtBodyTextControllerValidator;
  // Stores action output result for [Backend Call - API (sendEmail)] action in Button widget.
  ApiCallResponse? sent;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtSubjectFocusNode?.dispose();
    txtSubjectTextController?.dispose();

    txtBodyFocusNode?.dispose();
    txtBodyTextController?.dispose();
  }
}
