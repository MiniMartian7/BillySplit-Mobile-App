import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
  TextEditingController? sumController;
  String? Function(BuildContext, String?)? sumControllerValidator;
  // State field(s) for Specifications widget.
  TextEditingController? specificationsController;
  String? Function(BuildContext, String?)? specificationsControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Done widget.
  TransactionRecord? transactionRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    transactionController?.dispose();
    sumController?.dispose();
    specificationsController?.dispose();
  }

  /// Additional helper methods are added here.

}
