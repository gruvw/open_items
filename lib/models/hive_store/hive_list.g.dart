// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStoreListAdapter extends TypeAdapter<HiveStoreList> {
  @override
  final int typeId = 3;

  @override
  HiveStoreList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStoreList(
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
  void write(BinaryWriter writer, HiveStoreList obj) {
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
      other is HiveStoreListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
