import 'package:hive/hive.dart';

part 'setupInfo.g.dart';

@HiveType(typeId: 2)
class setupInfo {
  @HiveField(0)
  String batch;

  @HiveField(1)
  String trainer;

  setupInfo({required this.batch, required this.trainer});
}
