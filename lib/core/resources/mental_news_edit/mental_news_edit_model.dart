import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'mental_news_edit_widget.dart' show MentalNewsEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MentalNewsEditModel extends FlutterFlowModel<MentalNewsEditWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_headlineImage = false;
  FFUploadedFile uploadedLocalFile_headlineImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_headlineImage = '';

  // State field(s) for txtFdTitle widget.
  FocusNode? txtFdTitleFocusNode;
  TextEditingController? txtFdTitleTextController;
  String? Function(BuildContext, String?)? txtFdTitleTextControllerValidator;
  // State field(s) for txtFdDescription widget.
  FocusNode? txtFdDescriptionFocusNode;
  TextEditingController? txtFdDescriptionTextController;
  String? Function(BuildContext, String?)?
      txtFdDescriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtFdTitleFocusNode?.dispose();
    txtFdTitleTextController?.dispose();

    txtFdDescriptionFocusNode?.dispose();
    txtFdDescriptionTextController?.dispose();
  }
}
