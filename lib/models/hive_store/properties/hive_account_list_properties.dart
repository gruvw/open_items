import 'package:hive/hive.dart' hide HiveList;
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/hive_store/hive_list.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/properties/account_collection_properties.dart';

part 'hive_account_list_properties.g.dart';

@HiveType(typeId: 2)
class HiveStoreAccountListProperties with HiveObjectMixin {
  @HiveField(0)
  String hiveServerId;

  @HiveField(1)
  String hiveListLocalId;

  @HiveField(2)
  String hiveLexoRank;

  @HiveField(3)
  int hiveItemsOrderingIndex;

  @HiveField(4)
  bool hiveShouldReverseOrder;

  @HiveField(5)
  bool hiveShouldStackDone;

  HiveStoreAccountListProperties({
    required this.hiveServerId,
    required this.hiveListLocalId,
    required this.hiveItemsOrderingIndex,
    required this.hiveLexoRank,
    required this.hiveShouldReverseOrder,
    required this.hiveShouldStackDone,
  });
}

class HiveAccountListProperties extends AccountListProperties {
  final HiveStoreAccountListProperties hiveStoreAccountListProperties;
  final HiveDatabase hiveDatabase;

  HiveAccountListProperties({
    required this.hiveDatabase,
    required this.hiveStoreAccountListProperties,
  });

  @override
  Database get database => hiveDatabase;

  @override
  String get localId => hiveStoreAccountListProperties.key;

  @override
  String get serverId => hiveStoreAccountListProperties.hiveServerId;

  @override
  Liste get list {
    final hiveStoreList = hiveDatabase.listsBox.get(hiveStoreAccountListProperties.hiveListLocalId)!;

    return HiveList(
      hiveDatabase: hiveDatabase,
      hiveStoreList: hiveStoreList,
    );
  }

  @override
  String get lexoRank => hiveStoreAccountListProperties.hiveLexoRank;

  @override
  set lexoRank(String newLexoRank) {
    hiveStoreAccountListProperties.hiveLexoRank = newLexoRank;
    hiveStoreAccountListProperties.save();
  }

  @override
  int get itemsOrderingIndex => hiveStoreAccountListProperties.hiveItemsOrderingIndex;

  @override
  set itemsOrderingIndex(int newItemsOrderingIndex) {
    hiveStoreAccountListProperties.hiveItemsOrderingIndex = newItemsOrderingIndex;
    hiveStoreAccountListProperties.save();
  }

  @override
  bool get shouldReverseOrder => hiveStoreAccountListProperties.hiveShouldReverseOrder;

  @override
  set shouldReverseOrder(bool newShouldReverseOrder) {
    hiveStoreAccountListProperties.hiveShouldReverseOrder = newShouldReverseOrder;
    hiveStoreAccountListProperties.save();
  }

  @override
  bool get shouldStackDone => hiveStoreAccountListProperties.hiveShouldStackDone;

  @override
  set shouldStackDone(bool newShouldStackDone) {
    hiveStoreAccountListProperties.hiveShouldStackDone = newShouldStackDone;
    hiveStoreAccountListProperties.save();
  }

  @override
  void delete() {
    hiveStoreAccountListProperties.delete();
  }
}
