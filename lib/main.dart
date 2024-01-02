import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sr/Consts/box.dart';
import 'package:sr/Consts/key.dart';
import 'package:sr/Data/Hive/hiveHelper.dart';
import 'package:sr/Data/Hive/setupInfo.dart';
import 'package:sr/Data/Hive/students.dart';
import 'package:sr/Data/sharedPreference.dart';
import 'package:sr/Page/homePage.dart';
import 'package:sr/Page/setUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  get(sharedPreferenceisOpend);
  await Hive.initFlutter();
  Hive.registerAdapter(studentsAdapter());
  Hive.registerAdapter(setupInfoAdapter());
  studentBox = await Hive.openBox<students>('studentsBox');
  setupInfoBox = await Hive.openBox<setupInfo>('setupInfoBox');
  wholeStudentList = hiveSetValue(studentBox);
  wholeSetupList = hiveSetValue(setupInfoBox);
  runApp(const SessionReporter());
}

class SessionReporter extends StatelessWidget {
  const SessionReporter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isOpened == true ? const HomePage() : const SetUpPage(),
    );
  }
}
