// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_account.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveStoreAccountAdapter extends TypeAdapter<HiveStoreAccount> {
  @override
  final int typeId = 1;

  @override
  HiveStoreAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveStoreAccount(
      hiveServerId: fields[0] as String,
      hiveServer: fields[1] as String,
      hiveName: fields[2] as String,
      hiveAccountPropertiesLocalId: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveStoreAccount obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.hiveServerId)
      ..writeByte(1)
      ..write(obj.hiveServer)
      ..writeByte(2)
      ..write(obj.hiveName)
      ..writeByte(3)
      ..write(obj.hiveAccountPropertiesLocalId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveStoreAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
