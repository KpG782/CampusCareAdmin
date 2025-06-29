import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'create_notes_widget.dart' show CreateNotesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateNotesModel extends FlutterFlowModel<CreateNotesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtNotes widget.
  FocusNode? txtNotesFocusNode;
  TextEditingController? txtNotesTextController;
  String? Function(BuildContext, String?)? txtNotesTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtNotesFocusNode?.dispose();
    txtNotesTextController?.dispose();
  }
}
