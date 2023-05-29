import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'transactions_result_model.dart';
export 'transactions_result_model.dart';

class TransactionsResultWidget extends StatefulWidget {
  const TransactionsResultWidget({
    Key? key,
    required this.groupDetails,
    required this.transactionParticipants,
    required this.transactionName,
    required this.trasnsactionDescription,
    required this.transactionSum,
  }) : super(key: key);

  final DocumentReference? groupDetails;
  final List<DocumentReference>? transactionParticipants;
  final String? transactionName;
  final String? trasnsactionDescription;
  final double? transactionSum;

  @override
  _TransactionsResultWidgetState createState() =>
      _TransactionsResultWidgetState();
}

class _TransactionsResultWidgetState extends State<TransactionsResultWidget> {
  late TransactionsResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionsResultModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GroupsRecord>(
      stream: GroupsRecord.getDocument(widget.groupDetails!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        final transactionsResultGroupsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFF4B39EF),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  buttonSize: 46.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 26.0,
                  ),
                  onPressed: () async {
                    _model.sumBack = await actions.transactionSum(
                      widget.groupDetails!.id,
                    );

                    context.pushNamed(
                      'GroupPage',
                      queryParams: {
                        'groupDetails': serializeParam(
                          widget.groupDetails,
                          ParamType.DocumentReference,
                        ),
                        'sum': serializeParam(
                          _model.sumBack,
                          ParamType.double,
                        ),
                      }.withoutNulls,
                    );

                    setState(() {});
                  },
                ),
                Text(
                  'Transaction Details',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  height: 5.0,
                  thickness: 0.0,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 24.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.transactionName,
                                          'name',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 15.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.transactionSum?.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
                                child: Text(
                                  'lei',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 24.0, 0.0),
                            child: Text(
                              widget.trasnsactionDescription!,
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.transactionParticipants?.length
                                        ?.toString(),
                                    '0',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              _model.sum = await actions.transactionSum(
                                widget.groupDetails!.id,
                              );

                              context.pushNamed(
                                'GroupPage',
                                queryParams: {
                                  'groupDetails': serializeParam(
                                    widget.groupDetails,
                                    ParamType.DocumentReference,
                                  ),
                                  'sum': serializeParam(
                                    _model.sum,
                                    ParamType.double,
                                  ),
                                }.withoutNulls,
                              );

                              setState(() {});
                            },
                            text: 'Cancel',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
