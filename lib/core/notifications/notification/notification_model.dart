import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/core/main_pages/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'notification_widget.dart' show NotificationWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationModel extends FlutterFlowModel<NotificationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav component.
  late SideNavModel sideNavModel;
  bool isDataUploading_uploadDataCbq = false;
  FFUploadedFile uploadedLocalFile_uploadDataCbq =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for txtReceive widget.
  FocusNode? txtReceiveFocusNode;
  TextEditingController? txtReceiveTextController;
  String? Function(BuildContext, String?)? txtReceiveTextControllerValidator;
  // State field(s) for txtTitle widget.
  FocusNode? txtTitleFocusNode;
  TextEditingController? txtTitleTextController;
  String? Function(BuildContext, String?)? txtTitleTextControllerValidator;
  // State field(s) for txtText widget.
  FocusNode? txtTextFocusNode;
  TextEditingController? txtTextTextController;
  String? Function(BuildContext, String?)? txtTextTextControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    txtReceiveFocusNode?.dispose();
    txtReceiveTextController?.dispose();

    txtTitleFocusNode?.dispose();
    txtTitleTextController?.dispose();

    txtTextFocusNode?.dispose();
    txtTextTextController?.dispose();
  }
}
