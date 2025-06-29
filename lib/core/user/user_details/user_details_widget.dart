import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_details_model.dart';
export 'user_details_model.dart';

class UserDetailsWidget extends StatefulWidget {
  const UserDetailsWidget({
    super.key,
    required this.userID,
  });

  final DocumentReference? userID;

  @override
  State<UserDetailsWidget> createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState extends State<UserDetailsWidget> {
  late UserDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final chartPieChartColorsList = [
      Color(0xFF4A90E2),
      Color(0xFFF5A623),
      Color(0xFFD0021B),
      Color(0xFFE94E77),
      Color(0xFF8B572A),
      Color(0xFF50E3C2)
    ];
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(100.0, 100.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 997.3,
              height: 785.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background1,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'User Mood Details',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).text1,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: Color(0x001E1E1E),
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).text2,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: StreamBuilder<
                                              List<MoodLogRecord>>(
                                            stream: queryMoodLogRecord(
                                              queryBuilder: (moodLogRecord) =>
                                                  moodLogRecord
                                                      .where(
                                                        'userEmail',
                                                        isEqualTo: FFAppState()
                                                            .emailEditID,
                                                      )
                                                      .orderBy('date',
                                                          descending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MoodLogRecord>
                                                  containerMoodLogRecordList =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .background1,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Weekly Counter',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .text1,
                                                                        fontSize:
                                                                            20.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final moods =
                                                                containerMoodLogRecordList
                                                                    .toList();

                                                            return FlutterFlowDataTable<
                                                                MoodLogRecord>(
                                                              controller: _model
                                                                  .paginatedDataTableController,
                                                              data: moods,
                                                              columnsBuilder:
                                                                  (onSortChanged) =>
                                                                      [
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Text(
                                                                          'Date',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).text1,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 12.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'Mood Label',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).text1,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                DataColumn2(
                                                                  label:
                                                                      DefaultTextStyle
                                                                          .merge(
                                                                    softWrap:
                                                                        true,
                                                                    child: Text(
                                                                      'Activities',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).text1,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                              dataRowBuilder: (moodsItem,
                                                                      moodsIndex,
                                                                      selected,
                                                                      onSelectChanged) =>
                                                                  DataRow(
                                                                color:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                  moodsIndex %
                                                                              2 ==
                                                                          0
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                                cells: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                        "yMMMd",
                                                                        moodsItem
                                                                            .date!),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).text1,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    moodsItem
                                                                        .moodLabel,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).text1,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    '${moodsItem.activities.elementAtOrNull(0)},${moodsItem.activities.elementAtOrNull(1)},${moodsItem.activities.elementAtOrNull(2)}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).text1,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ]
                                                                    .map((c) =>
                                                                        DataCell(
                                                                            c))
                                                                    .toList(),
                                                              ),
                                                              paginated: true,
                                                              selectable: false,
                                                              hidePaginator:
                                                                  false,
                                                              showFirstLastButtons:
                                                                  true,
                                                              headingRowHeight:
                                                                  56.0,
                                                              dataRowHeight:
                                                                  48.0,
                                                              columnSpacing:
                                                                  20.0,
                                                              headingRowColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .text2,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              addHorizontalDivider:
                                                                  true,
                                                              addTopAndBottomDivider:
                                                                  false,
                                                              hideDefaultHorizontalDivider:
                                                                  true,
                                                              horizontalDividerColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .text2,
                                                              horizontalDividerThickness:
                                                                  1.0,
                                                              addVerticalDivider:
                                                                  false,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            height: 12.0))
                                                        .around(SizedBox(
                                                            height: 12.0)),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Weekly Mood Counter',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .text1,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Sadness',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text1,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF4A90E2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 4.0))
                                                          .around(SizedBox(
                                                              height: 4.0)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Joy',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text1,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF5A623),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 4.0))
                                                          .around(SizedBox(
                                                              height: 4.0)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Love',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text1,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFD0021B),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 4.0))
                                                          .around(SizedBox(
                                                              height: 4.0)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Anger',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text1,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFE94E77),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 4.0))
                                                          .around(SizedBox(
                                                              height: 4.0)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Fear',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text1,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF8B572A),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 4.0))
                                                          .around(SizedBox(
                                                              height: 4.0)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Surprise',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text1,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF50E3C2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 4.0))
                                                          .around(SizedBox(
                                                              height: 4.0)),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(width: 12.0))
                                                    .around(
                                                        SizedBox(width: 12.0)),
                                              ),
                                            ),
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<MoodLogRecord>>(
                                                stream: queryMoodLogRecord(
                                                  queryBuilder:
                                                      (moodLogRecord) =>
                                                          moodLogRecord
                                                              .where(
                                                                'userEmail',
                                                                isEqualTo:
                                                                    FFAppState()
                                                                        .emailEditID,
                                                              )
                                                              .where(
                                                                'date',
                                                                isGreaterThanOrEqualTo:
                                                                    functions
                                                                        .getDateDaysAgo(
                                                                            7),
                                                              ),
                                                )..listen((snapshot) {
                                                    List<MoodLogRecord>
                                                        containerMoodLogRecordList =
                                                        snapshot;
                                                    if (_model.containerPreviousSnapshot1 !=
                                                            null &&
                                                        !const ListEquality(
                                                                MoodLogRecordDocumentEquality())
                                                            .equals(
                                                                containerMoodLogRecordList,
                                                                _model
                                                                    .containerPreviousSnapshot1)) {
                                                      () async {
                                                        FFAppState()
                                                                .weeklyMoodCounts =
                                                            functions
                                                                .countWeeklyMoods(
                                                                    containerMoodLogRecordList
                                                                        .toList())
                                                                .toList()
                                                                .cast<double>();
                                                        safeSetState(() {});
                                                        FFAppState()
                                                                .dominantMood =
                                                            functions.getDominantMood(functions
                                                                .countWeeklyMoods(
                                                                    containerMoodLogRecordList
                                                                        .toList())
                                                                .toList())!;
                                                        safeSetState(() {});
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Mood Checked!',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );

                                                        safeSetState(() {});
                                                      }();
                                                    }
                                                    _model.containerPreviousSnapshot1 =
                                                        snapshot;
                                                  }),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<MoodLogRecord>
                                                      containerMoodLogRecordList =
                                                      snapshot.data!;

                                                  return Container(
                                                    height: 300.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 434.8,
                                                          height: 256.0,
                                                          child:
                                                              FlutterFlowPieChart(
                                                            data:
                                                                FFPieChartData(
                                                              values: FFAppState()
                                                                  .weeklyMoodCounts,
                                                              colors:
                                                                  chartPieChartColorsList,
                                                              radius: [100.0],
                                                              borderColor: [
                                                                Color(
                                                                    0x00000000)
                                                              ],
                                                            ),
                                                            donutHoleRadius:
                                                                20.0,
                                                            donutHoleColor:
                                                                Colors
                                                                    .transparent,
                                                            sectionLabelType:
                                                                PieChartSectionLabelType
                                                                    .value,
                                                            sectionLabelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .interTight(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                FFAppState().weeklyMoodCounts = functions
                                                                    .countWeeklyMoods(
                                                                        containerMoodLogRecordList
                                                                            .toList())
                                                                    .toList()
                                                                    .cast<
                                                                        double>();
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              text:
                                                                  'View Chart',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .interTight(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (FFAppState()
                                                                        .dominantMood ==
                                                                    'Sadness') {
                                                                  triggerPushNotification(
                                                                    notificationTitle:
                                                                        'We’re here for you 💙',
                                                                    notificationText:
                                                                        'We noticed you\'ve been feeling a bit low lately. Take a moment to explore our self-help tools like guided meditations or journaling, or consider booking a counseling session. You\'re not alone—Campus Care is always here to support you.',
                                                                    notificationImageUrl:
                                                                        currentUserPhoto,
                                                                    userRefs: [
                                                                      widget!
                                                                          .userID!
                                                                    ],
                                                                    initialPageName:
                                                                        'Notification',
                                                                    parameterData: {},
                                                                  );
                                                                } else if (FFAppState()
                                                                        .dominantMood ==
                                                                    'Joy') {
                                                                  triggerPushNotification(
                                                                    notificationTitle:
                                                                        'Keep the good vibes going! ☀️',
                                                                    notificationText:
                                                                        ' It\'s great to see you’ve had a joyful week! Want to capture that energy? Try journaling your positive moments or share your motivation with others in our upcoming workshops.',
                                                                    notificationImageUrl:
                                                                        currentUserPhoto,
                                                                    userRefs: [
                                                                      widget!
                                                                          .userID!
                                                                    ],
                                                                    initialPageName:
                                                                        'Notification',
                                                                    parameterData: {},
                                                                  );
                                                                } else if (FFAppState()
                                                                        .dominantMood ==
                                                                    'Love') {
                                                                  triggerPushNotification(
                                                                    notificationTitle:
                                                                        'Feeling connected is powerful 🤝',
                                                                    notificationText:
                                                                        'We see you’ve been experiencing feelings of love and connection. Nurture that positivity with self-reflection or dive into our resources on emotional intelligence and building relationships.',
                                                                    notificationImageUrl:
                                                                        currentUserPhoto,
                                                                    userRefs: [
                                                                      widget!
                                                                          .userID!
                                                                    ],
                                                                    initialPageName:
                                                                        'Notification',
                                                                    parameterData: {},
                                                                  );
                                                                } else if (FFAppState()
                                                                        .dominantMood ==
                                                                    'Anger') {
                                                                  triggerPushNotification(
                                                                    notificationTitle:
                                                                        'Take a breather—you’ve got this 🔄',
                                                                    notificationText:
                                                                        'Anger can be overwhelming. Try calming exercises like deep breathing or explore reflection tools in the app to help you process and reset. Support is just a tap away.',
                                                                    notificationImageUrl:
                                                                        currentUserPhoto,
                                                                    userRefs: [
                                                                      widget!
                                                                          .userID!
                                                                    ],
                                                                    initialPageName:
                                                                        'Notification',
                                                                    parameterData: {},
                                                                  );
                                                                } else if (FFAppState()
                                                                        .dominantMood ==
                                                                    'Fear') {
                                                                  triggerPushNotification(
                                                                    notificationTitle:
                                                                        'You’re safe and supported 🛡️',
                                                                    notificationText:
                                                                        ' It’s okay to feel uncertain. You\'re not alone. Use Campus Care to explore self-guided resources or talk to someone you trust through our secure chat with counselors.',
                                                                    notificationImageUrl:
                                                                        currentUserPhoto,
                                                                    userRefs: [
                                                                      widget!
                                                                          .userID!
                                                                    ],
                                                                    initialPageName:
                                                                        'Notification',
                                                                    parameterData: {},
                                                                  );
                                                                } else if (FFAppState()
                                                                        .dominantMood ==
                                                                    'Surprise') {
                                                                  triggerPushNotification(
                                                                    notificationTitle:
                                                                        ' Unexpected moments? Let\'s reflect 🌀',
                                                                    notificationText:
                                                                        'Surprises can bring growth—or confusion. Take time to reflect using our journaling features or book a short session with a counselor if something caught you off guard.',
                                                                    notificationImageUrl:
                                                                        currentUserPhoto,
                                                                    userRefs: [
                                                                      widget!
                                                                          .userID!
                                                                    ],
                                                                    initialPageName:
                                                                        'Notification',
                                                                    parameterData: {},
                                                                  );
                                                                }

                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Mood Checked!',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              },
                                                              text:
                                                                  'Check Moods',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .interTight(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 12.0))
                                                              .around(SizedBox(
                                                                  width: 12.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<MoodLogRecord>>(
                                                  stream: queryMoodLogRecord(
                                                    queryBuilder:
                                                        (moodLogRecord) =>
                                                            moodLogRecord
                                                                .where(
                                                                  'userEmail',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .emailEditID,
                                                                )
                                                                .where(
                                                                  'date',
                                                                  isGreaterThanOrEqualTo:
                                                                      functions
                                                                          .getDateDaysAgo(
                                                                              7),
                                                                ),
                                                  )..listen((snapshot) {
                                                      List<MoodLogRecord>
                                                          containerMoodLogRecordList =
                                                          snapshot;
                                                      if (_model.containerPreviousSnapshot2 !=
                                                              null &&
                                                          !const ListEquality(
                                                                  MoodLogRecordDocumentEquality())
                                                              .equals(
                                                                  containerMoodLogRecordList,
                                                                  _model
                                                                      .containerPreviousSnapshot2)) {
                                                        () async {
                                                          FFAppState()
                                                                  .weeklyTopActivities =
                                                              functions
                                                                  .countTopActivities(
                                                                      containerMoodLogRecordList
                                                                          .toList())!
                                                                  .toList()
                                                                  .cast<
                                                                      String>();
                                                          safeSetState(() {});

                                                          safeSetState(() {});
                                                        }();
                                                      }
                                                      _model.containerPreviousSnapshot2 =
                                                          snapshot;
                                                    }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<MoodLogRecord>
                                                        containerMoodLogRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      height: 200.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Top 3 Weekly Activities  ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).text1,
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Top 1 : ${valueOrDefault<String>(
                                                                    functions
                                                                        .countTopActivities(containerMoodLogRecordList
                                                                            .toList())
                                                                        ?.elementAtOrNull(
                                                                            0),
                                                                    'Top 1',
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .text1,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Top 2 : ${valueOrDefault<String>(
                                                                    functions
                                                                        .countTopActivities(containerMoodLogRecordList
                                                                            .toList())
                                                                        ?.elementAtOrNull(
                                                                            1),
                                                                    'Top 2',
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .text1,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Top 3 : ${valueOrDefault<String>(
                                                                    functions
                                                                        .countTopActivities(containerMoodLogRecordList
                                                                            .toList())
                                                                        ?.elementAtOrNull(
                                                                            2),
                                                                    'Top 3',
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .text1,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 12.0))
                                                              .around(SizedBox(
                                                                  height:
                                                                      12.0)),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 12.0))
                                  .around(SizedBox(width: 12.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 12.0))
                      .around(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
