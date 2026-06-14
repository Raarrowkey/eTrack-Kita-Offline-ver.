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

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/foundation.dart'; // Required for kIsWeb

Future initializeNotifications() async {
  // Do not initialize on Web, because the package is not supported
  if (kIsWeb) {
    return;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Timezone database initialization
  tz.initializeTimeZones();
  // Optional: Set the local time zone (may be necessary for accurate scheduling)
  // tz.setLocalLocation(tz.getLocation('Europe/Warsaw')); // Example for Poland

  // Android settings
  // Make sure you have the 'app_icon' in android/app/src/main/res/drawable
  // If not, use the default '@mipmap/ic_launcher' or change the name.
  // IMPORTANT: In FlutterFlow, it may not be easy to add your own icon without downloading the code.
  // Use '@mipmap/ic_launcher' if you haven’t added a custom icon.
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings(
          '@mipmap/ic_launcher'); // OR your own icon, e.g., 'app_icon'

  // iOS/macOS settings
  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    onDidReceiveLocalNotification:
        onDidReceiveLocalNotification, // Optional callback for older iOS versions
    requestAlertPermission:
        true, // By default requests basic permissions on initialization (can set to false and ask manually later)
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS:
          initializationSettingsDarwin); // You can use the same settings as for iOS

  try {
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // Callback triggered when user taps a notification (when app is closed or in background)
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      // Callback triggered when user taps a notification (while app is in foreground) - used less often
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
    print('FlutterLocalNotificationsPlugin initialized successfully.');
  } catch (e) {
    print('Error initializing FlutterLocalNotificationsPlugin: $e');
  }
}

// --- CALLBACK FUNCTIONS ---
// These functions must be defined at the top level (outside classes/functions) or as static methods

// Optional callback for older iOS versions (before iOS 10)
void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  // Here you can handle a notification received in the foreground on older iOS versions
  print(
      'onDidReceiveLocalNotification: id=$id, title=$title, body=$body, payload=$payload');
  // You can e.g., show a dialog
}

// Callback for notification tap (when the app is not in the foreground)
void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse) async {
  final String? payload = notificationResponse.payload;
  if (notificationResponse.payload != null) {
    debugPrint('notification payload: $payload');
  }
  // Here you can perform an action on tap, e.g., navigate to a specific screen.
  // NOTE: Navigation from this place in FlutterFlow may be complicated.
  // Usually, the item ID is passed in the payload and read on the main screen.
  print('Notification Tapped: payload=${notificationResponse.payload}');

  // Example: You can save the payload in App State and react to the change on the appropriate screen
  // FFAppState().update(() {
  //   FFAppState().notificationPayload = payload ?? '';
  // });
}

// Callback for notification tap (when the app is in the foreground)
@pragma('vm:entry-point') // Important for background handling
void onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse) {
  // Handle notification tapped background.
  print('Handling background notification response...');
  final String? payload = notificationResponse.payload;
  if (payload != null) {
    debugPrint('background notification payload: $payload');
  }
  print(
      'Background Notification Tapped: payload=${notificationResponse.payload}');
  // Here too, you can try to process the payload
}
