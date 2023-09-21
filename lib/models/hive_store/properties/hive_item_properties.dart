import 'package:hive/hive.dart';
import 'package:open_items/models/account_properties.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';

part 'hive_item_properties.g.dart';

@HiveType(typeId: 3)
class HiveStoreItemProperties with HiveObjectMixin {
  @HiveField(0)
  final String hiveId;

  @HiveField(1)
  String hiveLexoRank;

  HiveStoreItemProperties({
    required this.hiveId,
    required this.hiveLexoRank,
  });
}

class HiveItemProperties extends AccountItemProperties {
  final HiveStoreItemProperties hiveStoreItemProperties;
  final HiveDatabase hiveDatabase;

  HiveItemProperties({
    required this.hiveDatabase,
    required this.hiveStoreItemProperties,
  });

  @override
  Database get database => hiveDatabase;

  @override
  String get id => hiveStoreItemProperties.hiveId;

  @override
  String get lexoRank => hiveStoreItemProperties.hiveLexoRank;

  @override
  set lexoRank(String newLexoRank) {
    hiveStoreItemProperties.hiveLexoRank = newLexoRank;
    hiveStoreItemProperties.save();
  }

  @override
  void delete() {
    hiveStoreItemProperties.delete();
  }
}
