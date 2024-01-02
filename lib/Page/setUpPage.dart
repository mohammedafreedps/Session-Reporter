import 'package:flutter/material.dart';
import 'package:sr/Consts/box.dart';
import 'package:sr/Consts/colors.dart';
import 'package:sr/Consts/key.dart';
import 'package:sr/Consts/padding.dart';
import 'package:sr/Consts/screenSize.dart';
import 'package:sr/Data/Hive/hiveHelper.dart';
import 'package:sr/Data/sharedPreference.dart';
import 'package:sr/Functions/pageNavigation.dart';
import 'package:sr/Page/homePage.dart';
import 'package:sr/Page/setUpPageWidgets/supwText.dart';
import 'package:sr/Page/studentAddPage.dart';
import 'package:sr/Widgets/baseButton.dart';
import 'package:sr/Widgets/textField.dart';

class SetUpPage extends StatefulWidget {
  const SetUpPage({super.key});

  @override
  State<SetUpPage> createState() => _SetUpPageState();
}

class _SetUpPageState extends State<SetUpPage> {
  final batchController = TextEditingController();
  final trainerNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            SUPWText(content: 'Enter Batch'),
            TextFileFill(
              controller: batchController,
              willExpand: false,
            ),
            Spacer(),
            SUPWText(content: 'Enter Trainer Name'),
            TextFileFill(
              controller: trainerNameController,
              willExpand: false,
            ),
            Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseButton(
                  content: 'Add',
                  perform: () {
                    navigatePush(context, StudentAddPage());
                  },
                ),
                BaseButton(
                  content: 'Save',
                  perform: () {
                    if (batchController.text.isNotEmpty &&
                        trainerNameController.text.isNotEmpty) {
                      hiveInsertSetUp(setupInfoBox, batchController.text,
                          trainerNameController.text);
                      insert(true, sharedPreferenceisOpend);
                      navigatePushReplace(context, HomePage());
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
