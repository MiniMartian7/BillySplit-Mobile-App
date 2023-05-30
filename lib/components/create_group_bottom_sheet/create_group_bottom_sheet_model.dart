import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGroupBottomSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GroupName widget.
  TextEditingController? groupNameController;
  String? Function(BuildContext, String?)? groupNameControllerValidator;
  // State field(s) for GroupLimit widget.
  TextEditingController? groupLimitController;
  String? Function(BuildContext, String?)? groupLimitControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Done widget.
  GroupsRecord? groupDocOut;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    groupNameController?.dispose();
    groupLimitController?.dispose();
  }

  /// Additional helper methods are added here.

}
