import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'user_create_widget.dart' show UserCreateWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserCreateModel extends FlutterFlowModel<UserCreateWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for userUserEmail widget.
  FocusNode? userUserEmailFocusNode;
  TextEditingController? userUserEmailTextController;
  String? Function(BuildContext, String?)? userUserEmailTextControllerValidator;
  String? _userUserEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(
            '(?!.*@outlook\\.com|.*@gmail\\.com|.*@yahoo\\.com)(\\w[\\w\\.]*@\\w+\\.[\\w\\.]+)')
        .hasMatch(val)) {
      return 'Please use a valid UMak Email Address.';
    }
    return null;
  }

  // State field(s) for userUsername widget.
  FocusNode? userUsernameFocusNode;
  TextEditingController? userUsernameTextController;
  String? Function(BuildContext, String?)? userUsernameTextControllerValidator;
  String? _userUsernameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for userUserBio widget.
  FocusNode? userUserBioFocusNode;
  TextEditingController? userUserBioTextController;
  String? Function(BuildContext, String?)? userUserBioTextControllerValidator;
  String? _userUserBioTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;
  // Stores action output result for [Backend Call - API (createUserWithDetails)] action in UserBio widget.
  ApiCallResponse? apiResultc6h;

  @override
  void initState(BuildContext context) {
    userUserEmailTextControllerValidator =
        _userUserEmailTextControllerValidator;
    userUsernameTextControllerValidator = _userUsernameTextControllerValidator;
    userUserBioTextControllerValidator = _userUserBioTextControllerValidator;
    passwordVisibility = false;
    passwordConfirmVisibility = false;
  }

  @override
  void dispose() {
    userUserEmailFocusNode?.dispose();
    userUserEmailTextController?.dispose();

    userUsernameFocusNode?.dispose();
    userUsernameTextController?.dispose();

    userUserBioFocusNode?.dispose();
    userUserBioTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();
  }
}
