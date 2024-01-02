import 'package:flutter/material.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/dateAndTime.dart';
import 'package:sr/Consts/padding.dart';
import 'package:sr/Consts/screenSize.dart';
import 'package:sr/Consts/trensferValue.dart';
import 'package:sr/Functions/dateSelector.dart';
import 'package:sr/Functions/pageNavigation.dart';
import 'package:sr/Functions/timeSelector.dart';
import 'package:sr/Page/homePageWidgets/homePageBtn.dart';
import 'package:sr/Page/homePageWidgets/hpwText.dart';
import 'package:sr/Page/precentancePage.dart';
import 'package:sr/Widgets/textField.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todayActivityController = TextEditingController();
  final sessionReportController = TextEditingController();
  @override
  void didChangeDependencies() {
    screenSizeSetting(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(pagePadding),
          child: Column(
            children: [
              HPWText(content: 'Hi'),
              const Spacer(),
              HPWText(
                content: 'Select',
                time: selectedTime,
              ),
              HomePageBtn(
                content: 'select Time',
                perform: () async {
                  final _time = await selectTime(context);
                  setState(() {
                    print('called');
                    selectedTime = _time;
                  });
                },
              ),
              const Spacer(),
              HPWText(
                content: 'Select',
                date: selectedDate,
              ),
              HomePageBtn(
                content: 'select Date',
                perform: () async {
                  final _date = await selectDate(context);
                  setState(() {
                    selectedDate = _date;
                  });
                },
              ),
              const Spacer(),
              HPWText(content: 'Today Activity'),
              Expanded(
                  child: TextFileFill(
                controller: todayActivityController,
                willExpand: true,
              )),
              const Spacer(),
              HPWText(content: 'Session Report'),
              Expanded(
                  child: TextFileFill(
                controller: sessionReportController,
                willExpand: true,
              )),
              const Spacer(),
              HomePageBtn(
                content: 'Next',
                perform: () {
                  todayActivity = todayActivityController.text;
                  sessionReport = sessionReportController.text;
                  navigatePush(context, PrecentancePage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
