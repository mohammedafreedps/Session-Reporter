import 'package:flutter/material.dart';
import 'package:sr/Consts/box.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/padding.dart';
import 'package:sr/Consts/screenSize.dart';
import 'package:sr/Data/Hive/hiveHelper.dart';
import 'package:sr/Functions/pageNavigation.dart';
import 'package:sr/Page/homePageWidgets/homePageBtn.dart';
import 'package:sr/Page/homePageWidgets/hpwText.dart';
import 'package:sr/Page/percentancePageWidgets/participenceMarker.dart';
import 'package:sr/Widgets/textField.dart';

class StudentAddPage extends StatefulWidget {
  final Function? calback;
  const StudentAddPage({this.calback});

  @override
  State<StudentAddPage> createState() => _StudentAddPageState();
}

List _studentList = [];

class _StudentAddPageState extends State<StudentAddPage> {
  final nameController = TextEditingController();

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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(pagePadding),
            child: Column(
              children: [
                HPWText(content: 'Enter Name'),
                TextFileFill(
                  controller: nameController,
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: _studentList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ParcicipenceMarker(
                            index: index,
                            isNameOnly: true,
                            perform: () {
                              hiveDelete(studentBox, index);
                              _setValue();
                            },
                          );
                        })),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomePageBtn(
                      content: 'Add',
                      perform: () {
                        setState(() {
                          hiveInsert(studentBox, nameController.text, false,
                              false, false, false);
                        });
                        _setValue();
                        setState(() {
                          nameController.text = '';
                        });
                        print(_studentList.length);
                      },
                    ),
                    HomePageBtn(
                      content: 'Done',
                      perform: () {
                        if (widget.calback != null) {
                          widget.calback!();
                        }
                        navigatePop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
