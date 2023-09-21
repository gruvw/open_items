import 'package:hive/hive.dart';
import 'package:open_items/models/account_properties.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';

part 'hive_list_properties.g.dart';

@HiveType(typeId: 2)
class HiveStoreListProperties with HiveObjectMixin {
  @HiveField(0)
  final String hiveId;

  @HiveField(1)
  String hiveLexoRank;

  @HiveField(2)
  int hiveItemsOrderingIndex;

  @HiveField(3)
  bool hiveShouldReverseOrder;

  @HiveField(4)
  bool hiveShouldStackDone;

  HiveStoreListProperties({
    required this.hiveId,
    required this.hiveItemsOrderingIndex,
    required this.hiveLexoRank,
    required this.hiveShouldReverseOrder,
    required this.hiveShouldStackDone,
  });
}

class HiveListProperties extends AccountListProperties {
  final HiveStoreListProperties hiveStoreListProperties;
  final HiveDatabase hiveDatabase;

  HiveListProperties({
    required this.hiveDatabase,
    required this.hiveStoreListProperties,
  });

  @override
  Database get database => hiveDatabase;

  @override
  String get id => hiveStoreListProperties.hiveId;

  @override
  String get lexoRank => hiveStoreListProperties.hiveLexoRank;

  @override
  set lexoRank(String newLexoRank) {
    hiveStoreListProperties.hiveLexoRank = newLexoRank;
    hiveStoreListProperties.save();
  }

  @override
  int get itemsOrderingIndex => hiveStoreListProperties.hiveItemsOrderingIndex;

  @override
  set itemsOrderingIndex(int newItemsOrderingIndex) {
    hiveStoreListProperties.hiveItemsOrderingIndex = newItemsOrderingIndex;
    hiveStoreListProperties.save();
  }

  @override
  bool get shouldReverseOrder => hiveStoreListProperties.hiveShouldReverseOrder;

  @override
  set shouldReverseOrder(bool newShouldReverseOrder) {
    hiveStoreListProperties.hiveShouldReverseOrder = newShouldReverseOrder;
    hiveStoreListProperties.save();
  }

  @override
  bool get shouldStackDone => hiveStoreListProperties.hiveShouldStackDone;

  @override
  set shouldStackDone(bool newShouldStackDone) {
    hiveStoreListProperties.hiveShouldStackDone = newShouldStackDone;
    hiveStoreListProperties.save();
  }

  @override
  void delete() {
    hiveStoreListProperties.delete();
  }
}
