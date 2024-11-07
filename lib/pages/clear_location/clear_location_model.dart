import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'clear_location_widget.dart' show ClearLocationWidget;
import 'package:flutter/material.dart';

class ClearLocationModel extends FlutterFlowModel<ClearLocationWidget> {
  ///  Local state fields for this page.

  String? position;

  List<String> positionList = [];
  void addToPositionList(String item) => positionList.add(item);
  void removeFromPositionList(String item) => positionList.remove(item);
  void removeAtIndexFromPositionList(int index) => positionList.removeAt(index);
  void insertAtIndexInPositionList(int index, String item) =>
      positionList.insert(index, item);
  void updatePositionListAtIndex(int index, Function(String) updateFn) =>
      positionList[index] = updateFn(positionList[index]);

  List<String> positionIdList = [];
  void addToPositionIdList(String item) => positionIdList.add(item);
  void removeFromPositionIdList(String item) => positionIdList.remove(item);
  void removeAtIndexFromPositionIdList(int index) =>
      positionIdList.removeAt(index);
  void insertAtIndexInPositionIdList(int index, String item) =>
      positionIdList.insert(index, item);
  void updatePositionIdListAtIndex(int index, Function(String) updateFn) =>
      positionIdList[index] = updateFn(positionIdList[index]);

  List<LocationDetailStruct> locationDetails = [];
  void addToLocationDetails(LocationDetailStruct item) =>
      locationDetails.add(item);
  void removeFromLocationDetails(LocationDetailStruct item) =>
      locationDetails.remove(item);
  void removeAtIndexFromLocationDetails(int index) =>
      locationDetails.removeAt(index);
  void insertAtIndexInLocationDetails(int index, LocationDetailStruct item) =>
      locationDetails.insert(index, item);
  void updateLocationDetailsAtIndex(
          int index, Function(LocationDetailStruct) updateFn) =>
      locationDetails[index] = updateFn(locationDetails[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getLocationList)] action in ClearLocation widget.
  ApiCallResponse? apiResultaac;
  // Stores action output result for [Custom Action - findPositionIdAction] action in BarcodeScannerWidget widget.
  String? curPositionId;
  // Stores action output result for [Backend Call - API (GetLocationDetail)] action in BarcodeScannerWidget widget.
  ApiCallResponse? apiResulte6r;
  // Stores action output result for [Backend Call - API (RelateGoods)] action in Button widget.
  ApiCallResponse? apiResultgsi;
  // Stores action output result for [Backend Call - API (GetLocationDetail)] action in Button widget.
  ApiCallResponse? apiResult9hx;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
