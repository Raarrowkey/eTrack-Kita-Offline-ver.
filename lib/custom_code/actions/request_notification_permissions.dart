// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform; // Needed to check the platform

Future<bool> requestNotificationPermissions() async {
  if (kIsWeb) return false; // Not applicable for Web

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool? result = false;

  try {
    if (Platform.isIOS) {
      result = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      print('iOS permission result: $result');
    } else if (Platform.isAndroid) {
      // For Android 13+
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      result = await androidImplementation
          ?.requestNotificationsPermission(); // Newer method for Android 13+
      // Alternatively, if you're using an older version of the plugin or targeting older Android:
      // result = await androidImplementation?.requestPermission();
      print('Android permission result: $result');
    }
    return result ?? false;
  } catch (e) {
    print('Error requesting permissions: $e');
    return false;
  }
}
