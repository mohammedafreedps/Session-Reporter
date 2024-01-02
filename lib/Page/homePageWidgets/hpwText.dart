import 'package:flutter/material.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/fontSize.dart';

class HPWText extends StatelessWidget {
  final String content;
  final TimeOfDay? time;
  final DateTime? date;
  HPWText({required this.content, this.time, this.date});

  @override
  Widget build(BuildContext context) {
    return time != null || date != null
        ? Text(
            date == null
                ? time!.hour.toString() + ' - ' + time!.minute.toString()
                : date!.day.toString() +
                    ' - ' +
                    date!.month.toString() +
                    ' - ' +
                    date!.year.toString(),
            style: TextStyle(fontSize: fontSize2, color: midWhiteFontColor),
          )
        : Text(
            content,
            style: TextStyle(fontSize: fontSize2, color: midWhiteFontColor),
          );
  }
}
