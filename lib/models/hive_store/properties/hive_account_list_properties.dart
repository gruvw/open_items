import 'package:hive/hive.dart';
import 'package:open_items/models/account_properties.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/list.dart';

part 'hive_account_list_properties.g.dart';

@HiveType(typeId: 2)
class HiveStoreAccountListProperties with HiveObjectMixin {
  @HiveField(0)
  String hiveListKey;

  @HiveField(1)
  String hiveLexoRank;

  @HiveField(2)
  int hiveItemsOrderingIndex;

  @HiveField(3)
  bool hiveShouldReverseOrder;

  @HiveField(4)
  bool hiveShouldStackDone;

  HiveStoreAccountListProperties({
    required this.hiveListKey,
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
  String get id => hiveStoreAccountListProperties.key;

  @override
  // TODO: implement list
  Liste get list => throw UnimplementedError();

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
