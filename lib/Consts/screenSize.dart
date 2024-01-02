import 'package:flutter/material.dart';

double screenWidth = 0;
double screenHeight = 0;
void screenSizeSetting(BuildContext context) {
  screenWidth = MediaQuery.of(context).size.width;
  screenHeight = MediaQuery.of(context).size.height;
}
