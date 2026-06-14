import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OpenWeatherCurrentCall {
  static Future<ApiCallResponse> call({
    String? lat = '',
    String? lng = '',
    String? apikey = '217a535035c464c2c4877e25cca675e5',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'openWeatherCurrent',
      apiUrl:
          'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lng}&appid=${apikey}&units=metric',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? currentTemp(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.main.temp''',
      ));
  static String? currentWeatherDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.weather[:].description''',
      ));
  static String? currentWeatherIcon(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.weather[:].icon''',
      ));
  static String? currentWeatherName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.weather[:].main''',
      ));
  static int? currentDateTime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.dt''',
      ));
  static String? currentCountry(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.sys.country''',
      ));
  static String? currentCity(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static int? currentHumidity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.humidity''',
      ));
  static double? currentWindSpeed(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.wind.speed''',
      ));
}

class OpenWeatherDailyCall {
  static Future<ApiCallResponse> call({
    String? lat = '',
    String? lng = '',
    String? apikey = '217a535035c464c2c4877e25cca675e5',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'openWeatherDaily',
      apiUrl:
          'api.openweathermap.org/data/2.5/forecast/daily?lat=${lat}&lon=${lng}&appid=${apikey}&units=metric',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<double>? dailyTempMin(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].temp.min''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? dailyTempMax(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].temp.max''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<int>? dailyDateTime(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].dt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? dailyWeatherName(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].weather[:].main''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dailyWeatherDescription(dynamic response) =>
      (getJsonField(
        response,
        r'''$.list[:].weather[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dailyWeatherIcon(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].weather[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? dailyList(dynamic response) => getJsonField(
        response,
        r'''$.list''',
        true,
      ) as List?;
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
  if (item is DocumentReference) {
    return item.path;
  }
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
