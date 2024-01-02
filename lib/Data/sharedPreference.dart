import 'package:shared_preferences/shared_preferences.dart';

bool? isOpened;

void insert(bool isLogined, String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, isLogined);
}

void get(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isOpened = await prefs.getBool(key);
}

