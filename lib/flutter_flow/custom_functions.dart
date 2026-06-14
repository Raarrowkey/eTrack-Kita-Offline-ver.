import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/sqlite/sqlite_manager.dart';

String latLngToString(
  LatLng latLng,
  bool isLat,
) {
  if (latLng == null) {
    return '';
  }
  return isLat ? latLng.latitude.toString() : latLng.longitude.toString();
}

DateTime convertUnixToDateTime(String unixString) {
  //parses unix string to int
  int unixTimestamp = int.tryParse(unixString) ?? 0;

  //converts the unix value timestamp to DateTime
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000, isUtc: true);
  return dateTime;
}

double sumTwoTexts(
  String a,
  String b,
) {
  final num1 = double.tryParse(a) ?? 0;
  final num2 = double.tryParse(b) ?? 0;
  return num1 + num2;
}

int? sumValues(
  int? firstValue,
  int? secondValue,
) {
  if (firstValue == null && secondValue == null) {
    return null;
  }
  return (firstValue ?? 0) + (secondValue ?? 0);
}

DateTime? intUnixToDateTime(int? unixSample) {
  if (unixSample == null) {
    return null;
  }
  return DateTime.fromMillisecondsSinceEpoch(unixSample * 1000);
}

List<DateTime> getMonthDateRange(DateTime inputDate) {
  //
  // Calculate the first day of the current month
  DateTime firstDayCurrentMonth = DateTime(inputDate.year, inputDate.month, 1);

  // Calculate the first day of the next month, then subtract one day to get the last day of the current month
  DateTime lastDayCurrentMonth =
      DateTime(inputDate.year, inputDate.month + 1, 1)
          .subtract(Duration(days: 1));

  // Return a list containing both dates
  return [firstDayCurrentMonth, lastDayCurrentMonth];
}

String getYearFromDate(DateTime? dateTime) {
  return (dateTime?.year ?? DateTime.now().year).toString();
}
