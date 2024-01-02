// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setupInfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class setupInfoAdapter extends TypeAdapter<setupInfo> {
  @override
  final int typeId = 2;

  @override
  setupInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return setupInfo(
      batch: fields[0] as String,
      trainer: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, setupInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.batch)
      ..writeByte(1)
      ..write(obj.trainer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is setupInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
