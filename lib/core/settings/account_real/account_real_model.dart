import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/core/main_pages/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'account_real_widget.dart' show AccountRealWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountRealModel extends FlutterFlowModel<AccountRealWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel;
  bool isDataUploading_adminPhoto123 = false;
  FFUploadedFile uploadedLocalFile_adminPhoto123 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_adminPhoto123 = '';

  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for UpdteEmail widget.
  FocusNode? updteEmailFocusNode;
  TextEditingController? updteEmailTextController;
  String? Function(BuildContext, String?)? updteEmailTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ddRole widget.
  String? ddRoleValue;
  FormFieldController<String>? ddRoleValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for txtAchievements widget.
  FocusNode? txtAchievementsFocusNode;
  TextEditingController? txtAchievementsTextController;
  String? Function(BuildContext, String?)?
      txtAchievementsTextControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    updteEmailFocusNode?.dispose();
    updteEmailTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    txtAchievementsFocusNode?.dispose();
    txtAchievementsTextController?.dispose();
  }
}
