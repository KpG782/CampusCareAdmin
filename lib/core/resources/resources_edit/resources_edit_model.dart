import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import 'resources_edit_widget.dart' show ResourcesEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResourcesEditModel extends FlutterFlowModel<ResourcesEditWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  String? projectNameValue;
  FormFieldController<String>? projectNameValueController;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode1;
  TextEditingController? descriptionTextController1;
  String? Function(BuildContext, String?)? descriptionTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode2;
  TextEditingController? descriptionTextController2;
  String? Function(BuildContext, String?)? descriptionTextController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode3;
  TextEditingController? descriptionTextController3;
  String? Function(BuildContext, String?)? descriptionTextController3Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode4;
  TextEditingController? descriptionTextController4;
  String? Function(BuildContext, String?)? descriptionTextController4Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode5;
  TextEditingController? descriptionTextController5;
  String? Function(BuildContext, String?)? descriptionTextController5Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionFocusNode1?.dispose();
    descriptionTextController1?.dispose();

    descriptionFocusNode2?.dispose();
    descriptionTextController2?.dispose();

    descriptionFocusNode3?.dispose();
    descriptionTextController3?.dispose();

    descriptionFocusNode4?.dispose();
    descriptionTextController4?.dispose();

    descriptionFocusNode5?.dispose();
    descriptionTextController5?.dispose();
  }
}
