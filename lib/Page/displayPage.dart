import 'package:flutter/material.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/dateAndTime.dart';
import 'package:sr/Consts/padding.dart';
import 'package:sr/Consts/screenSize.dart';
import 'package:sr/Consts/trensferValue.dart';
import 'package:sr/Data/Hive/hiveHelper.dart';
import 'package:sr/Functions/clipBoard.dart';
import 'package:sr/Functions/timeFormatter.dart';
import 'package:sr/Page/displayPageWidgets/dpwText.dart';
import 'package:sr/Page/homePageWidgets/homePageBtn.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  String generateClipboardContent() {
    String clipboardContent = '';
    clipboardContent += '🕑 ' + formatTime(selectedTime).toString() + '\n';
    clipboardContent += '🗓 ' +
        selectedDate.day.toString() +
        '-' +
        selectedDate.month.toString() +
        '-' +
        selectedDate.year.toString() +
        '\n';
    clipboardContent += 'Batch: ' + _upSet.batch + '\n\n';
    clipboardContent += 'Today\'s Activity: \n' + todayActivity + '\n\n';
    clipboardContent += '🛎🛎🛎🛎🛎🛎🛎\n\n';
    clipboardContent += 'Trainer: ' + _upSet.trainer + '\n';
    clipboardContent += 'Co-ordinators : ';
    for (final coordinator in _cordinator) {
      clipboardContent += coordinator.name + ' ';
    }
    clipboardContent += '\n\n';
    clipboardContent += '📢📢📢📢📢📢📢\n\n';
    clipboardContent += todayActivity;
    clipboardContent += '🟪🟪🟪🟪🟪🟪🟪\n\n';
    clipboardContent += 'Attendees:\n';
    for (final precentee in _precentees) {
      clipboardContent += '✅ ' + precentee.name + '\n';
    }
    clipboardContent += '\n🟦🟦🟦🟦🟦🟦🟦\n\n';
    clipboardContent += 'Absentees:(Reported)\n';
    for (final abcentee in _absenteesInformed) {
      clipboardContent += '❌ ' + abcentee.name + '\n';
    }
    clipboardContent += '\n🟨🟨🟨🟨🟨🟨🟨\n\n';
    clipboardContent += 'Not Reported:\n';
    for (final abcentee in _absenteesNotInformed) {
      clipboardContent += '❌ ' + abcentee.name + '\n';
    }
    clipboardContent += '\n🟥🟥🟥🟥🟥🟥🟥\n\n';
    clipboardContent += '🖊 Report by: ';
    for (final reporter in _reportBy) {
      clipboardContent += reporter.name + ' ';
    }

    return clipboardContent;
  }

  List _precentees = [];
  List _absenteesInformed = [];
  List _absenteesNotInformed = [];
  List _cordinator = [];
  List _reportBy = [];
  dynamic _setUpData = [];
  dynamic _upSet;
  _distributer() {
    _setUpData = wholeSetupList[0];
    _upSet = _setUpData;
    _precentees =
        wholeStudentList.where((student) => student.isPrecent).toList();
    _absenteesInformed = wholeStudentList
        .where((student) => student.isPrecent == false && student.isInformed)
        .toList();
    _absenteesNotInformed = wholeStudentList
        .where((student) => student.isPrecent == false)
        .toList();
    _cordinator =
        wholeStudentList.where((student) => student.isCordinator).toList();
    _reportBy =
        wholeStudentList.where((student) => student.isReported).toList();
  }

  @override
  void initState() {
    _distributer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _day = selectedDate.day;
    int _month = selectedDate.month;
    int _year = selectedDate.year;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: backgroundColor,
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.all(pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DPWText(content: '⏲️ ' + formatTime(selectedTime).toString()),
                DPWText(
                    content: '📅 ' +
                        _day.toString() +
                        ' - ' +
                        _month.toString() +
                        ' - ' +
                        _year.toString()),
                DPWText(content: 'Batch: ' + _upSet.batch),
                DPWText(content: 'Today Activity:' + ''),
                DPWText(content: todayActivity),
                DPWText(content: 'Trainer: ' + _upSet.trainer),
                DPWText(content: 'Cordinator:'),
                for (final cocordinater in _cordinator)
                  DPWText(content: cocordinater.name),
                DPWText(content: sessionReport),
                DPWText(content: 'Attendees:'),
                for (final precentee in _precentees)
                  DPWText(content: '✅' + precentee.name),
                DPWText(content: 'Absentees Reported:'),
                for (final abcentee in _absenteesInformed)
                  DPWText(content: '❌' + abcentee.name),
                DPWText(content: 'Absentees NotReported:'),
                for (final abcentee in _absenteesNotInformed)
                  DPWText(content: 'ℹ' + abcentee.name),
                DPWText(content: '🖊️' + 'Reported By:'),
                for (final reporter in _reportBy)
                  DPWText(content: reporter.name),
                HomePageBtn(
                  content: 'Copy',
                  perform: () {
                    String _con = generateClipboardContent();
                    copyToClipBoard(_con);
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
