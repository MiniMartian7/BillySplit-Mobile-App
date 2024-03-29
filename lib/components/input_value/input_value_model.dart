import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InputValueModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for inputValueField widget.
  TextEditingController? inputValueFieldController;
  String? Function(BuildContext, String?)? inputValueFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    inputValueFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
