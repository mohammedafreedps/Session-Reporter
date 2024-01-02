import 'package:flutter/material.dart';
import 'package:sr/Consts/box.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/padding.dart';
import 'package:sr/Consts/screenSize.dart';
import 'package:sr/Data/Hive/hiveHelper.dart';
import 'package:sr/Functions/pageNavigation.dart';
import 'package:sr/Page/displayPage.dart';
import 'package:sr/Page/homePageWidgets/homePageBtn.dart';
import 'package:sr/Page/homePageWidgets/hpwText.dart';
import 'package:sr/Page/percentancePageWidgets/participenceMarker.dart';
import 'package:sr/Page/studentAddPage.dart';

class PrecentancePage extends StatefulWidget {
  PrecentancePage({super.key});

  @override
  State<PrecentancePage> createState() => _PrecentancePageState();
}

class _PrecentancePageState extends State<PrecentancePage> {
  List _studentList = [];
  void _setValue() {
    wholeStudentList = hiveSetValue(studentBox);
    setState(() {
      _studentList = wholeStudentList;
    });
  }

  @override
  void initState() {
    _setValue();
    super.initState();
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
              HPWText(content: 'Select'),
              Expanded(
                child: ListView.builder(
                    itemCount: _studentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ParcicipenceMarker(
                        index: index,
                        isNameOnly: false,
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomePageBtn(
                    content: 'Add/Remove',
                    perform: () {
                      navigatePush(
                          context,
                          StudentAddPage(
                            calback: _setValue,
                          ));
                    },
                  ),
                  HomePageBtn(
                    content: 'Next',
                    perform: () {
                      navigatePush(context, DisplayPage());
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
