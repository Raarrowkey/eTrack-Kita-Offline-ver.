import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _chartOption = prefs.getString('ff_chartOption') ?? _chartOption;
    });
    _safeInit(() {
      _showOnboard = prefs.getBool('ff_showOnboard') ?? _showOnboard;
    });
    _safeInit(() {
      _activeNotification =
          prefs.getBool('ff_activeNotification') ?? _activeNotification;
    });
    _safeInit(() {
      _dueVisible = prefs.getBool('ff_dueVisible') ?? _dueVisible;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _chartOption = '';
  String get chartOption => _chartOption;
  set chartOption(String value) {
    _chartOption = value;
    prefs.setString('ff_chartOption', value);
  }

  String _testLogs = '';
  String get testLogs => _testLogs;
  set testLogs(String value) {
    _testLogs = value;
  }

  bool _showOnboard = true;
  bool get showOnboard => _showOnboard;
  set showOnboard(bool value) {
    _showOnboard = value;
    prefs.setBool('ff_showOnboard', value);
  }

  bool _activeNotification = false;
  bool get activeNotification => _activeNotification;
  set activeNotification(bool value) {
    _activeNotification = value;
    prefs.setBool('ff_activeNotification', value);
  }

  bool _dueVisible = true;
  bool get dueVisible => _dueVisible;
  set dueVisible(bool value) {
    _dueVisible = value;
    prefs.setBool('ff_dueVisible', value);
  }

  bool _dailyNotif = true;
  bool get dailyNotif => _dailyNotif;
  set dailyNotif(bool value) {
    _dailyNotif = value;
  }

  final _cacheCurrentLocationManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> cacheCurrentLocation({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _cacheCurrentLocationManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCacheCurrentLocationCache() => _cacheCurrentLocationManager.clear();
  void clearCacheCurrentLocationCacheKey(String? uniqueKey) =>
      _cacheCurrentLocationManager.clearRequest(uniqueKey);

  final _cacheDailyLocationManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> cacheDailyLocation({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _cacheDailyLocationManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCacheDailyLocationCache() => _cacheDailyLocationManager.clear();
  void clearCacheDailyLocationCacheKey(String? uniqueKey) =>
      _cacheDailyLocationManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
