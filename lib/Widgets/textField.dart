import 'package:flutter/material.dart';
import 'package:sr/Consts/colors.dart';

class TextFileFill extends StatelessWidget {
  final TextEditingController? controller;
  final bool? willExpand;

  TextFileFill({this.controller, this.willExpand});

  @override
  Widget build(BuildContext context) {
    print(controller);
    return willExpand == true
        ? TextField(
            style: TextStyle(color: midWhiteFontColor),
            controller: controller,
            maxLines: null,
            expands: true,
            cursorColor: midWhiteFontColor,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: midWhiteFontColor))),
          )
        : TextField(
            style: TextStyle(color: midWhiteFontColor),
            controller: controller,
            cursorColor: midWhiteFontColor,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: midWhiteFontColor))));
  }
}
