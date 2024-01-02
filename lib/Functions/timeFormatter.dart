import 'package:flutter/material.dart';

String formatTime(TimeOfDay time) {
  int hour = time.hour;
  int minute = time.minute;

  String amPm = (hour < 12) ? 'AM' : 'PM';

  hour = hour % 12;
  hour = (hour == 0) ? 12 : hour;

  String minuteString = (minute < 10) ? '0$minute' : '$minute';

  return '$hour:$minuteString $amPm';
}
