import 'package:hive/hive.dart';
import 'package:open_items/models/account_collection_properties.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/item.dart';

part 'hive_account_item_properties.g.dart';

@HiveType(typeId: 3)
class HiveStoreAccountItemProperties with HiveObjectMixin {
  @HiveField(0)
  String hiveServerId;

  @HiveField(1)
  String hiveItemKey;

  @HiveField(2)
  String hiveLexoRank;

  HiveStoreAccountItemProperties({
    required this.hiveServerId,
    required this.hiveItemKey,
    required this.hiveLexoRank,
  });
}

class HiveAccountItemProperties extends AccountItemProperties {
  final HiveStoreAccountItemProperties hiveStoreAccountItemProperties;
  final HiveDatabase hiveDatabase;

  HiveAccountItemProperties({
    required this.hiveDatabase,
    required this.hiveStoreAccountItemProperties,
  });

  @override
  Database get database => hiveDatabase;

  @override
  String get localId => hiveStoreAccountItemProperties.key;

  @override
  String get serverId => hiveStoreAccountItemProperties.hiveServerId;

  @override
  // TODO: implement item
  Item get item => throw UnimplementedError();

  @override
  String get lexoRank => hiveStoreAccountItemProperties.hiveLexoRank;

  @override
  set lexoRank(String newLexoRank) {
    hiveStoreAccountItemProperties.hiveLexoRank = newLexoRank;
    hiveStoreAccountItemProperties.save();
  }

  @override
  void delete() {
    hiveStoreAccountItemProperties.delete();
  }
}
