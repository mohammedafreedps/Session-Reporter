// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentsAdapter extends TypeAdapter<students> {
  @override
  final int typeId = 1;

  @override
  students read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return students(
      name: fields[0] as String,
      isPrecent: fields[1] as bool,
      isInformed: fields[2] as bool,
      isCordinator: fields[3] as bool,
      isReported: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, students obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isPrecent)
      ..writeByte(2)
      ..write(obj.isInformed)
      ..writeByte(3)
      ..write(obj.isCordinator)
      ..writeByte(4)
      ..write(obj.isReported);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
