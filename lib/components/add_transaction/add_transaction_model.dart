import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddTransactionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Transaction widget.
  TextEditingController? transactionController;
  String? Function(BuildContext, String?)? transactionControllerValidator;
  // State field(s) for Sum widget.
  TextEditingController? sumController1;
  String? Function(BuildContext, String?)? sumController1Validator;
  // State field(s) for Sum widget.
  TextEditingController? sumController2;
  String? Function(BuildContext, String?)? sumController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    transactionController?.dispose();
    sumController1?.dispose();
    sumController2?.dispose();
  }

  /// Additional helper methods are added here.

}
