import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/core/main_pages/side_nav/side_nav_widget.dart';
import '/core/sessions/add_calendar/add_calendar_widget.dart';
import '/core/sessions/create_notes/create_notes_widget.dart';
import '/core/sessions/send_approved/send_approved_widget.dart';
import '/core/sessions/send_reject/send_reject_widget.dart';
import '/core/sessions/view_details/view_details_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'session_widget.dart' show SessionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessionModel extends FlutterFlowModel<SessionWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for txtSearch widget.
  FocusNode? txtSearchFocusNode;
  TextEditingController? txtSearchTextController;
  String? Function(BuildContext, String?)? txtSearchTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<BookingsRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<BookingsRecord>();
  // State field(s) for txtSearchApproved widget.
  FocusNode? txtSearchApprovedFocusNode;
  TextEditingController? txtSearchApprovedTextController;
  String? Function(BuildContext, String?)?
      txtSearchApprovedTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController3 =
      FlutterFlowDataTableController<BookingsRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController4 =
      FlutterFlowDataTableController<BookingsRecord>();
  // State field(s) for txtSearchDone widget.
  FocusNode? txtSearchDoneFocusNode;
  TextEditingController? txtSearchDoneTextController;
  String? Function(BuildContext, String?)? txtSearchDoneTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController5 =
      FlutterFlowDataTableController<BookingsRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController6 =
      FlutterFlowDataTableController<BookingsRecord>();
  // State field(s) for txtSearchTransfer widget.
  FocusNode? txtSearchTransferFocusNode;
  TextEditingController? txtSearchTransferTextController;
  String? Function(BuildContext, String?)?
      txtSearchTransferTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController7 =
      FlutterFlowDataTableController<BookingsRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController8 =
      FlutterFlowDataTableController<BookingsRecord>();

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    tabBarController?.dispose();
    txtSearchFocusNode?.dispose();
    txtSearchTextController?.dispose();

    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    txtSearchApprovedFocusNode?.dispose();
    txtSearchApprovedTextController?.dispose();

    paginatedDataTableController3.dispose();
    paginatedDataTableController4.dispose();
    txtSearchDoneFocusNode?.dispose();
    txtSearchDoneTextController?.dispose();

    paginatedDataTableController5.dispose();
    paginatedDataTableController6.dispose();
    txtSearchTransferFocusNode?.dispose();
    txtSearchTransferTextController?.dispose();

    paginatedDataTableController7.dispose();
    paginatedDataTableController8.dispose();
  }
}
