import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_new_chat_widget.dart' show CreateNewChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateNewChatModel extends FlutterFlowModel<CreateNewChatWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for txtnewMessage widget.
  FocusNode? txtnewMessageFocusNode;
  TextEditingController? txtnewMessageTextController;
  String? Function(BuildContext, String?)? txtnewMessageTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtnewMessageFocusNode?.dispose();
    txtnewMessageTextController?.dispose();
  }
}
