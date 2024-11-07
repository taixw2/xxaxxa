import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'clear_location_model.dart';
export 'clear_location_model.dart';

class ClearLocationWidget extends StatefulWidget {
  const ClearLocationWidget({
    super.key,
    required this.warehouseId,
  });

  final String? warehouseId;

  @override
  State<ClearLocationWidget> createState() => _ClearLocationWidgetState();
}

class _ClearLocationWidgetState extends State<ClearLocationWidget> {
  late ClearLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClearLocationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultaac = await StockAPIGroup.getLocationListCall.call(
        warehouseId: widget.warehouseId,
        token: FFAppState().TOKEN,
        session: FFAppState().SESSION,
      );

      if (StockAPIGroup.getLocationListCall.errno(
            (_model.apiResultaac?.jsonBody ?? ''),
          ) ==
          1) {
        _model.positionList = StockAPIGroup.getLocationListCall
            .position(
              (_model.apiResultaac?.jsonBody ?? ''),
            )!
            .toList()
            .cast<String>();
        _model.positionIdList = StockAPIGroup.getLocationListCall
            .positionId(
              (_model.apiResultaac?.jsonBody ?? ''),
            )!
            .toList()
            .cast<String>();
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '加载位置异常',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '查询库位',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 17.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '货架位置',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            _model.position,
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100.0,
                                height: 44.0,
                                child: custom_widgets.BarcodeScannerWidget(
                                  width: 100.0,
                                  height: 44.0,
                                  onSuccess: (res) async {
                                    _model.position = res;
                                    safeSetState(() {});
                                    _model.curPositionId =
                                        await actions.findPositionIdAction(
                                      _model.positionList.toList(),
                                      _model.positionIdList.toList(),
                                      res,
                                    );
                                    _model.apiResulte6r = await StockAPIGroup
                                        .getLocationDetailCall
                                        .call(
                                      locationId: _model.curPositionId,
                                      warehouseId: widget.warehouseId,
                                      token: FFAppState().TOKEN,
                                      session: FFAppState().SESSION,
                                    );

                                    if (StockAPIGroup.getLocationDetailCall
                                            .errno(
                                          (_model.apiResulte6r?.jsonBody ?? ''),
                                        ) ==
                                        1) {
                                      _model.locationDetails = StockAPIGroup
                                          .getLocationDetailCall
                                          .data(
                                            (_model.apiResulte6r?.jsonBody ??
                                                ''),
                                          )!
                                          .toList()
                                          .cast<LocationDetailStruct>();
                                      safeSetState(() {});
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                          Builder(
                            builder: (context) {
                              final locationDetailList =
                                  _model.locationDetails.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(locationDetailList.length,
                                        (locationDetailListIndex) {
                                  final locationDetailListItem =
                                      locationDetailList[
                                          locationDetailListIndex];
                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                locationDetailListItem.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '编号：${locationDetailListItem.code}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    '库存${locationDetailListItem.stockNumber}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(width: 12.0)),
                                              ),
                                            ].divide(const SizedBox(height: 8.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).divide(const SizedBox(height: 16.0)),
                              );
                            },
                          ),
                        ].divide(const SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.apiResultgsi =
                          await StockAPIGroup.relateGoodsCall.call(
                        goods: '[]',
                        position: _model.curPositionId,
                        token: FFAppState().TOKEN,
                        session: FFAppState().SESSION,
                      );

                      _model.apiResult9hx =
                          await StockAPIGroup.getLocationDetailCall.call(
                        locationId: _model.curPositionId,
                        warehouseId: widget.warehouseId,
                        token: FFAppState().TOKEN,
                        session: FFAppState().SESSION,
                      );

                      if (StockAPIGroup.getLocationDetailCall.errno(
                            (_model.apiResult9hx?.jsonBody ?? ''),
                          ) ==
                          1) {
                        _model.locationDetails =
                            StockAPIGroup.getLocationDetailCall
                                .data(
                                  (_model.apiResult9hx?.jsonBody ?? ''),
                                )!
                                .toList()
                                .cast<LocationDetailStruct>();
                        safeSetState(() {});
                      }

                      safeSetState(() {});
                    },
                    text: '清空',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
