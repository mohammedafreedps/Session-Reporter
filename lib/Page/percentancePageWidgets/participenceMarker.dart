import 'package:flutter/material.dart';
import 'package:sr/Consts/box.dart';
import 'package:sr/Consts/builderCardProperty.dart';
import 'package:sr/Consts/screenSize.dart';
import 'package:sr/Data/Hive/hiveHelper.dart';
import 'package:sr/Page/homePageWidgets/hpwText.dart';

class ParcicipenceMarker extends StatefulWidget {
  final int index;
  final Function? perform;
  final bool isNameOnly;
  ParcicipenceMarker(
      {required this.index, this.perform, required this.isNameOnly});

  @override
  State<ParcicipenceMarker> createState() => _ParcicipenceMarkerState();
}

class _ParcicipenceMarkerState extends State<ParcicipenceMarker> {
  @override
  Widget build(BuildContext context) {
    final _values = wholeStudentList[widget.index];
    return widget.isNameOnly == true
        ? InkWell(
            onLongPress: () {
              if (widget.perform != null) {
                widget.perform!();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(builderCardBorederRadiout),
                child: Container(
                  width: screenWidth,
                  height: builderCardHeitht,
                  color: builderCardColor,
                  child: Center(child: HPWText(content: _values.name)),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(builderCardBorederRadiout),
              child: Container(
                width: screenWidth,
                height: builderCardHeitht,
                color: builderCardColor,
                child: Column(
                  children: [
                    HPWText(content: _values.name),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HPWText(content: 'Precent'),
                        Switch(
                            value: _values.isPrecent,
                            onChanged: (value) {
                              hiveEdit(
                                  studentBox,
                                  widget.index,
                                  _values.name,
                                  value,
                                  _values.isInformed,
                                  _values.isCordinator,
                                  _values.isReported);
                              setState(() {
                                value = _values.isPrecent;
                                print(_values.isPrecent.toString() +
                                    _values.name);
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HPWText(content: 'Informed'),
                        Switch(
                            value: _values.isInformed,
                            onChanged: (value) {
                              hiveEdit(
                                  studentBox,
                                  widget.index,
                                  _values.name,
                                  _values.isPrecent,
                                  value,
                                  _values.isCordinator,
                                  _values.isReported);
                              setState(() {
                                value = _values.isInformed;
                                print(_values.isInformed.toString() +
                                    _values.name);
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HPWText(content: 'Cordinator'),
                        Switch(
                            value: _values.isCordinator,
                            onChanged: (value) {
                              hiveEdit(
                                  studentBox,
                                  widget.index,
                                  _values.name,
                                  _values.isPrecent,
                                  _values.isInformed,
                                  value,
                                  _values.isReported);
                              setState(() {
                                value = _values.isCordinator;
                                print(_values.isPrecent.toString() +
                                    _values.name);
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HPWText(content: 'Reporter'),
                        Switch(
                            value: _values.isReported,
                            onChanged: (value) {
                              hiveEdit(
                                  studentBox,
                                  widget.index,
                                  _values.name,
                                  _values.isPrecent,
                                  _values.isInformed,
                                  _values.isCordinator,
                                  value);
                              setState(() {
                                value = _values.isPrecent;
                                print(_values.isPrecent.toString() +
                                    _values.name);
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
