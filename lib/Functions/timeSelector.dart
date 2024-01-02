import 'package:flutter/material.dart';

Future<TimeOfDay> selectTime(BuildContext context) async {
  final TimeOfDay? pickedTime =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());
  if (pickedTime != null) {
    return pickedTime;
  }
  return TimeOfDay.now();
}
