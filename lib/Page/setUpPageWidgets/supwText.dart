import 'package:flutter/material.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/fontSize.dart';

class SUPWText extends StatelessWidget {
  final String content;
  SUPWText({required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(fontSize: fontSize1, color: midWhiteFontColor),
    );
  }
}
