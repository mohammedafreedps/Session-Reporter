import 'package:hive/hive.dart';
import 'package:sr/Data/Hive/setupInfo.dart';
import 'package:sr/Data/Hive/students.dart';

List wholeStudentList = [];
List wholeSetupList = [];

void hiveInsert(Box box, String name, bool isPrecent, bool isInformed,
    bool isCordinator, bool isReported) {
  box.put(
      DateTime.now().toString(),
      students(
          name: name,
          isPrecent: isPrecent,
          isInformed: isInformed,
          isCordinator: isCordinator,
          isReported: isReported));
}

void hiveInsertSetUp(Box box, String batch, String trainer) {
  box.put(DateTime.now().toString(), setupInfo(batch: batch, trainer: trainer));
}

students hiveGet(Box box, int index) {
  return box.getAt(index);
}

void hiveDelete(Box box, int index) {
  box.deleteAt(index);
}

void hiveEdit(Box box, int index, String name, bool isPrecent, bool isInformed,
    bool isCordinator, bool isReported) {
  students forEdit = box.getAt(index);

  forEdit.name = name;
  forEdit.isPrecent = isPrecent;
  forEdit.isInformed = isInformed;
  forEdit.isCordinator = isCordinator;
  forEdit.isReported = isReported;

  box.putAt(index, forEdit);
}

void hiveEditSetup(Box box, int index, String batch, String trainer) {
  dynamic forEdit = box.getAt(index);
  forEdit.batch = batch;
  forEdit.trainer = trainer;

  box.putAt(index, forEdit);
}

dynamic hiveSetValue(Box box) {
  List values = box.values.toList();
  return values;
}
