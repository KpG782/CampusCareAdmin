import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'view_details_widget.dart' show ViewDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewDetailsModel extends FlutterFlowModel<ViewDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtCouncilorNotes widget.
  FocusNode? txtCouncilorNotesFocusNode;
  TextEditingController? txtCouncilorNotesTextController;
  String? Function(BuildContext, String?)?
      txtCouncilorNotesTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtCouncilorNotesFocusNode?.dispose();
    txtCouncilorNotesTextController?.dispose();
  }
}
