import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/core/main_pages/side_nav/side_nav_widget.dart';
import '/core/user/edit_account/edit_account_widget.dart';
import '/core/user/user_create/user_create_widget.dart';
import '/core/user/user_details/user_details_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for txtFdSearch widget.
  FocusNode? txtFdSearchFocusNode;
  TextEditingController? txtFdSearchTextController;
  String? Function(BuildContext, String?)? txtFdSearchTextControllerValidator;
  // State field(s) for DropDownDepartment widget.
  String? dropDownDepartmentValue;
  FormFieldController<String>? dropDownDepartmentValueController;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<UsersRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<UsersRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController3 =
      FlutterFlowDataTableController<UsersRecord>();

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    txtFdSearchFocusNode?.dispose();
    txtFdSearchTextController?.dispose();

    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    paginatedDataTableController3.dispose();
  }
}
