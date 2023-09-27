// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_account_list_properties.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStoreAccountListPropertiesAdapter
    extends TypeAdapter<HiveStoreAccountListProperties> {
  @override
  final int typeId = 2;

  @override
  HiveStoreAccountListProperties read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStoreAccountListProperties(
      hiveServerId: fields[0] as String,
      hiveAccountLocalId: fields[1] as String,
      hiveListLocalId: fields[2] as String,
      hiveLexoRank: fields[3] as String,
      hiveItemsOrderingIndex: fields[4] as int,
      hiveShouldReverseOrder: fields[5] as bool,
      hiveShouldStackDone: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveStoreAccountListProperties obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.hiveServerId)
      ..writeByte(1)
      ..write(obj.hiveAccountLocalId)
      ..writeByte(2)
      ..write(obj.hiveListLocalId)
      ..writeByte(3)
      ..write(obj.hiveLexoRank)
      ..writeByte(4)
      ..write(obj.hiveItemsOrderingIndex)
      ..writeByte(5)
      ..write(obj.hiveShouldReverseOrder)
      ..writeByte(6)
      ..write(obj.hiveShouldStackDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveStoreAccountListPropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
