import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_value_model.dart';
export 'input_value_model.dart';

class InputValueWidget extends StatefulWidget {
  const InputValueWidget({
    Key? key,
    String? sum,
    required this.transactionRef,
  })  : this.sum = sum ?? '0',
        super(key: key);

  final String sum;
  final DocumentReference? transactionRef;

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

    _model.inputValueFieldController ??=
        TextEditingController(text: widget.sum);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFormField(
          controller: _model.inputValueFieldController,
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
                color: Color(0xFFDBE2E7),
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
                EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 20.0, 24.0),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF1D2429),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
          maxLines: null,
          validator:
              _model.inputValueFieldControllerValidator.asValidator(context),
        ),
        FFButtonWidget(
          onPressed: () async {
            Navigator.pop(context);

            final transactionUpdateData = {
              'userDebt': FieldValue.arrayUnion(
                  [double.tryParse(_model.inputValueFieldController.text)]),
            };
            await widget.transactionRef!.update(transactionUpdateData);
          },
          text: 'Save',
          options: FFButtonOptions(
            height: 40.0,
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                ),
            elevation: 3.0,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ],
    );
  }
}
