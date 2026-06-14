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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;
import '/custom_code/actions/check_exact_alarm_permission.dart';

Future<void> _logAndUpdateState(String message) async {
  print(message);
  FFAppState().update(() {
    FFAppState().testLogs = message + '\n' + (FFAppState().testLogs ?? '');
  });
}

Future<bool> scheduleNotification(
  int notificationId,
  String title,
  String body,
  DateTime scheduleTime,
  String? payload,
) async {
  await _logAndUpdateState('-- scheduleNotification: Started --');

  if (kIsWeb) {
    await _logAndUpdateState('Web platform detected. Returning false.');
    return false;
  }

  // Check permissions on Android
  if (Platform.isAndroid) {
    bool hasPermission = await checkExactAlarmPermission();
    if (!hasPermission) {
      await _logAndUpdateState(
          'No permission for exact alarms. Returning false.');
      return false;
    }
    await _logAndUpdateState('Exact alarm permission granted.');
  }

  // Use the global instance of the plugin instead of creating a new one
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Default values for the notification channel
  final String channelId =
      'high_importance_channel'; // Use same ID as in initialization
  final String channelName = 'High Importance Notifications';
  final String channelDesc = 'Channel for important notifications';
  final String finalPayload = payload ?? "default_payload";

  // Log notification data
  await _logAndUpdateState(
      'Notification data - ID: $notificationId, Title: $title, Body: $body');
  await _logAndUpdateState('Scheduled for: $scheduleTime');

  // Convert to TZDateTime - time zone initialization should already be done in initializeNotifications()
  tz.TZDateTime scheduledDate;
  try {
    scheduledDate = tz.TZDateTime.from(scheduleTime, tz.local);
    await _logAndUpdateState('Converted to TZDateTime: $scheduledDate');
  } catch (e) {
    await _logAndUpdateState('Error converting to TZDateTime: $e');
    return false;
  }

  // Check if the date is in the future
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  if (scheduledDate.isBefore(now)) {
    await _logAndUpdateState('ERROR: Date is in the past. Returning false.');
    return false;
  }

  // Notification details
  final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    channelId,
    channelName,
    channelDescription: channelDesc,
    importance: Importance.max,
    priority: Priority.high,
    fullScreenIntent: true, // Try to display a full-screen notification
    category: AndroidNotificationCategory
        .alarm, // Alarm category - may help with triggering
  );

  const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
    presentAlert: true, // Show alert
    presentBadge: true, // Update badge
    presentSound: true, // Play sound
  );

  final NotificationDetails notificationDetails = NotificationDetails(
    android: androidDetails,
    iOS: iosDetails,
    macOS: iosDetails,
  );

  try {
    await _logAndUpdateState('Sending notification...');

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      title,
      body,
      scheduledDate,
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: finalPayload,
    );

    await _logAndUpdateState('Notification scheduled! Returning true.');
    return true;
  } catch (e) {
    await _logAndUpdateState('ERROR while scheduling: $e');
    return false;
  }
}
// END custom action code
