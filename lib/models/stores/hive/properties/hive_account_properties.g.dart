// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_account_properties.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStoreAccountPropertiesAdapter
    extends TypeAdapter<HiveStoreAccountProperties> {
  @override
  final int typeId = 4;

  @override
  HiveStoreAccountProperties read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStoreAccountProperties(
      hiveAccountLocalId: fields[0] as String,
      hiveListsOrderingIndex: fields[1] as int,
      hiveAccountListPropertiesLocalIds: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveStoreAccountProperties obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.hiveAccountLocalId)
      ..writeByte(1)
      ..write(obj.hiveListsOrderingIndex)
      ..writeByte(2)
      ..write(obj.hiveAccountListPropertiesLocalIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveStoreAccountPropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
