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
import 'input_value_model.dart';
export 'input_value_model.dart';

class InputValueWidget extends StatefulWidget {
  const InputValueWidget({
    Key? key,
    required this.userId,
    required this.transactionId,
  }) : super(key: key);

  final String? userId;
  final String? transactionId;

  @override
  _InputValueWidgetState createState() => _InputValueWidgetState();
}

class _InputValueWidgetState extends State<InputValueWidget> {
  late InputValueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputValueModel());

    _model.inputValueFieldController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BalanceRecord>>(
      stream: queryBalanceRecord(
        queryBuilder: (balanceRecord) => balanceRecord
            .where('user_id', isEqualTo: widget.userId)
            .where('transaction_id', isEqualTo: widget.transactionId),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitRing(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        List<BalanceRecord> inputValueFieldBalanceRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final inputValueFieldBalanceRecord =
            inputValueFieldBalanceRecordList.isNotEmpty
                ? inputValueFieldBalanceRecordList.first
                : null;
        return Container(
          width: 60.0,
          child: TextFormField(
            controller: _model.inputValueFieldController,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.inputValueFieldController',
              Duration(milliseconds: 2000),
              () async {
                final balanceUpdateData = createBalanceRecordData(
                  debt: double.tryParse(_model.inputValueFieldController.text),
                );
                await inputValueFieldBalanceRecord!.reference
                    .update(balanceUpdateData);
              },
            ),
            obscureText: false,
            decoration: InputDecoration(
              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF57636C),
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF57636C),
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF4B39EF),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF4B39EF),
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
            textAlign: TextAlign.end,
            validator:
                _model.inputValueFieldControllerValidator.asValidator(context),
          ),
        );
      },
    );
  }
}
