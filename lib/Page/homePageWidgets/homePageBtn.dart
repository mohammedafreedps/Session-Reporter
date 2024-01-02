import 'package:flutter/material.dart';
import 'package:sr/Consts/borderRadious.dart';
import 'package:sr/Consts/buttonSize.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/fontSize.dart';

class HomePageBtn extends StatelessWidget {
  final String content;
  final Function? perform;
  HomePageBtn({required this.content, this.perform});

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
          width: homePagebtnWidth,
          height: homePagebtnHeight,
          child: Center(
            child: Text(
              content,
              style: TextStyle(
                  color: midWhiteFontColor, fontSize: homePagebtnFontSize1),
            ),
          ),
        ),
      ),
    );
  }
}
