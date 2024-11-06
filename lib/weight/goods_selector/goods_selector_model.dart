import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goods_selector_widget.dart' show GoodsSelectorWidget;
import 'package:flutter/material.dart';

class GoodsSelectorModel extends FlutterFlowModel<GoodsSelectorWidget> {
  ///  Local state fields for this component.

  List<GoodsDTStruct> goodsList = [];
  void addToGoodsList(GoodsDTStruct item) => goodsList.add(item);
  void removeFromGoodsList(GoodsDTStruct item) => goodsList.remove(item);
  void removeAtIndexFromGoodsList(int index) => goodsList.removeAt(index);
  void insertAtIndexInGoodsList(int index, GoodsDTStruct item) =>
      goodsList.insert(index, item);
  void updateGoodsListAtIndex(int index, Function(GoodsDTStruct) updateFn) =>
      goodsList[index] = updateFn(goodsList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (SearchGoods)] action in TextField widget.
  ApiCallResponse? apiResulttu9;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
