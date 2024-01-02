import 'package:flutter/material.dart';

Future<DateTime> selectDate(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040));
  if (pickedDate != null) {
    return pickedDate;
  }
  return DateTime.now();
}
