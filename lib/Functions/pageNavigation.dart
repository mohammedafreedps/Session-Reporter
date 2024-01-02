import 'package:flutter/material.dart';

void navigatePush(BuildContext context, Widget Page) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return Page;
  }));
}

void navigatePushReplace(BuildContext context, Widget Page) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return Page;
  }));
}

void navigatePop(BuildContext context) {
  Navigator.pop(context);
}
