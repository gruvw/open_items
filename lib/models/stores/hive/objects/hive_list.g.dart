// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStoreListeAdapter extends TypeAdapter<HiveStoreListe> {
  @override
  final int typeId = 3;

  @override
  HiveStoreListe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStoreListe(
      hiveServerId: fields[0] as String,
      hiveOwnerAccountLocalId: fields[1] as String,
      hiveTitle: fields[2] as String,
      hiveTypeIndex: fields[3] as int,
      hiveCreationTime: fields[4] as int,
      hiveEditionTime: fields[5] as int,
      hiveItemsLocalIds: (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveStoreListe obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.hiveServerId)
      ..writeByte(1)
      ..write(obj.hiveOwnerAccountLocalId)
      ..writeByte(2)
      ..write(obj.hiveTitle)
      ..writeByte(3)
      ..write(obj.hiveTypeIndex)
      ..writeByte(4)
      ..write(obj.hiveCreationTime)
      ..writeByte(5)
      ..write(obj.hiveEditionTime)
      ..writeByte(6)
      ..write(obj.hiveItemsLocalIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveStoreListeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
