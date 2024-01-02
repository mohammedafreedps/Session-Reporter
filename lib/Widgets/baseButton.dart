import 'package:flutter/material.dart';
import 'package:sr/Consts/borderRadious.dart';
import 'package:sr/Consts/buttonSize.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/fontSize.dart';

class BaseButton extends StatelessWidget {
  final String content;
  final Function? perform;
  BaseButton({required this.content, this.perform});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (perform != null) {
          perform!();
        }
        
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(buttonBorderRadiout),
        child: Container(
          color: midWhiteFontColor,
          width: btnWidth1,
          height: btnHeight1,
          child: Center(
            child: Text(
              content,
              style: TextStyle(
                  color: midWhiteFontColor, fontSize: buttonFontSize1),
            ),
          ),
        ),
      ),
    );
  }
}
