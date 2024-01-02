import 'package:hive/hive.dart';

part 'students.g.dart';

@HiveType(typeId: 1)
class students {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isPrecent;

  @HiveField(2)
  bool isInformed;

  @HiveField(3)
  bool isCordinator;

  @HiveField(4)
  bool isReported;

  students(
      {required this.name,
      required this.isPrecent,
      required this.isInformed,
      required this.isCordinator,
      required this.isReported});
}
