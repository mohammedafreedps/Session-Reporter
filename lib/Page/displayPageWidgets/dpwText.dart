import 'package:flutter/material.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/fontSize.dart';

class DPWText extends StatelessWidget {
  final String content;
  DPWText({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(fontSize: displayFontSize, color: midWhiteFontColor),
    );
  }
}
