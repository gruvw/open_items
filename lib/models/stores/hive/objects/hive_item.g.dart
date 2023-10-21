// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStoreItemAdapter extends TypeAdapter<HiveStoreItem> {
  @override
  final int typeId = 5;

  @override
  HiveStoreItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStoreItem(
      hiveServerId: fields[0] as String,
      hiveText: fields[1] as String,
      hiveTypeIndex: fields[2] as int,
      hiveCreationTime: fields[3] as int,
      hiveEditionTime: fields[4] as int,
      hiveDoneTime: fields[5] as int,
      hiveLexoRank: fields[6] as String,
      hiveIsDone: fields[7] as bool,
      hiveListLocalId: fields[8] as String,
      hiveParentLocalId: fields[9] as String,
      hiveItemsLocalIds: (fields[10] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveStoreItem obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.hiveServerId)
      ..writeByte(1)
      ..write(obj.hiveText)
      ..writeByte(2)
      ..write(obj.hiveTypeIndex)
      ..writeByte(3)
      ..write(obj.hiveCreationTime)
      ..writeByte(4)
      ..write(obj.hiveEditionTime)
      ..writeByte(5)
      ..write(obj.hiveDoneTime)
      ..writeByte(6)
      ..write(obj.hiveLexoRank)
      ..writeByte(7)
      ..write(obj.hiveIsDone)
      ..writeByte(8)
      ..write(obj.hiveListLocalId)
      ..writeByte(9)
      ..write(obj.hiveParentLocalId)
      ..writeByte(10)
      ..write(obj.hiveItemsLocalIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveStoreItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
