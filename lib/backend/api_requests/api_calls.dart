import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start StockAPI Group Code

class StockAPIGroup {
  static String getBaseUrl({
    String? token = '88678cac5ffcf32ea81b05f81e0aad6e',
    String? session = 'or2vm320oojg2ni6cg80u17s56',
  }) =>
      'https://stock.maiyatian.com/';
  static Map<String, String> headers = {
    'Cookie': 'token=[TOKEN]; PHPSESSID=[SESSION]',
  };
  static GetWarehouseListCall getWarehouseListCall = GetWarehouseListCall();
  static GetLocationListCall getLocationListCall = GetLocationListCall();
  static SearchGoodsCall searchGoodsCall = SearchGoodsCall();
  static RelateGoodsCall relateGoodsCall = RelateGoodsCall();
}

class GetWarehouseListCall {
  Future<ApiCallResponse> call({
    String? token = '88678cac5ffcf32ea81b05f81e0aad6e',
    String? session = 'or2vm320oojg2ni6cg80u17s56',
  }) async {
    final baseUrl = StockAPIGroup.getBaseUrl(
      token: token,
      session: session,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetWarehouseList',
      apiUrl: '${baseUrl}warehouse/apiList/',
      callType: ApiCallType.GET,
      headers: {
        'Cookie': 'token=$token; PHPSESSID=$session',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].name''',
      ));
}

class GetLocationListCall {
  Future<ApiCallResponse> call({
    String? warehouseId = '',
    String? token = '88678cac5ffcf32ea81b05f81e0aad6e',
    String? session = 'or2vm320oojg2ni6cg80u17s56',
  }) async {
    final baseUrl = StockAPIGroup.getBaseUrl(
      token: token,
      session: session,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getLocationList',
      apiUrl: '$baseUrl/location/apiList/',
      callType: ApiCallType.GET,
      headers: {
        'Cookie': 'token=$token; PHPSESSID=$session',
      },
      params: {
        'warehouse_id': warehouseId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? tags(dynamic response) => getJsonField(
        response,
        r'''$.data[:].boxs[:].layers[:].tags''',
        true,
      ) as List?;
  int? errno(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.errno''',
      ));
  List<String>? position(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].boxs[:].layers[:].tags[:].position''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? positionId(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].boxs[:].layers[:].tags[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SearchGoodsCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
    String? warehouseId = '',
    String? f = 'json',
    int? isBuy = 1,
    String? token = '88678cac5ffcf32ea81b05f81e0aad6e',
    String? session = 'or2vm320oojg2ni6cg80u17s56',
  }) async {
    final baseUrl = StockAPIGroup.getBaseUrl(
      token: token,
      session: session,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SearchGoods',
      apiUrl: '${baseUrl}index/list/',
      callType: ApiCallType.GET,
      headers: {
        'Cookie': 'token=$token; PHPSESSID=$session',
      },
      params: {
        'keyword': keyword,
        'warehouse_id': warehouseId,
        'f': f,
        'page': "1",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? errno(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.errno''',
      ));
  List<GoodsDTStruct>? goods(dynamic response) => (getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => GoodsDTStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class RelateGoodsCall {
  Future<ApiCallResponse> call({
    String? goods = '',
    String? position = '',
    String? token = '88678cac5ffcf32ea81b05f81e0aad6e',
    String? session = 'or2vm320oojg2ni6cg80u17s56',
  }) async {
    final baseUrl = StockAPIGroup.getBaseUrl(
      token: token,
      session: session,
    );

    final ffApiRequestBody = '''
{
  "position": "$position",
  "goods": "$goods"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RelateGoods',
      apiUrl: '${baseUrl}location/apiRelate/',
      callType: ApiCallType.POST,
      headers: {
        'Cookie': 'token=$token; PHPSESSID=$session',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? errno(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.errno''',
      ));
}

/// End StockAPI Group Code

class CheckLoginedCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? session = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CheckLogined',
      apiUrl: 'https://saas.maiyatian.com/notify/dialog/?f=json',
      callType: ApiCallType.GET,
      headers: {
        'Cookie': 'token=$token; PHPSESSID=$session',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? error(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.errno''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
