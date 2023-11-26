import 'package:hive/hive.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/models/stores/hive/hive_database.dart';

part 'hive_account_list_properties.g.dart';

@HiveType(typeId: 2)
class HiveStoreAccountListProperties with HiveObjectMixin {
  @HiveField(0)
  String hiveServerId;

  @HiveField(1)
  String hiveAccountLocalId;

  @HiveField(2)
  String hiveListLocalId;

  @HiveField(3)
  String hiveLexoRank;

  @HiveField(4)
  int hiveItemsOrderingIndex;

  @HiveField(5)
  bool hiveShouldReverseOrder;

  @HiveField(6)
  bool hiveShouldStackDone;

  HiveStoreAccountListProperties({
    required this.hiveServerId,
    required this.hiveAccountLocalId,
    required this.hiveListLocalId,
    required this.hiveLexoRank,
    required this.hiveItemsOrderingIndex,
    required this.hiveShouldReverseOrder,
    required this.hiveShouldStackDone,
  });
}

class HiveAccountListProperties extends AccountListProperties {
  final HiveStoreAccountListProperties hiveStoreAccountListProperties;
  final HiveDatabase hiveDatabase;

  // Database
  @override
  final String localId;
  @override
  final String serverId;

  // Immutable (not with copyWith)
  @override
  final String listLocalId;
  @override
  final String userLocalId;

  // Mutable
  @override
  final String lexoRank;
  @override
  final bool shouldReverseOrder;
  @override
  final bool shouldStackDone;
  @override
  final int itemsOrderingIndex;

  HiveAccountListProperties({
    required this.hiveDatabase,
    required this.hiveStoreAccountListProperties,
    String? lexoRank,
    bool? shouldReverseOrder,
    bool? shouldStackDone,
    int? itemsOrderingIndex,
  })  : lexoRank = lexoRank ?? hiveStoreAccountListProperties.hiveLexoRank,
        shouldReverseOrder =
            shouldReverseOrder ?? hiveStoreAccountListProperties.hiveShouldReverseOrder,
        shouldStackDone = shouldStackDone ?? hiveStoreAccountListProperties.hiveShouldStackDone,
        itemsOrderingIndex =
            itemsOrderingIndex ?? hiveStoreAccountListProperties.hiveItemsOrderingIndex,
        listLocalId = hiveStoreAccountListProperties.hiveListLocalId,
        userLocalId = hiveStoreAccountListProperties.hiveAccountLocalId,
        localId = hiveStoreAccountListProperties.key,
        serverId = hiveStoreAccountListProperties.hiveServerId;

  @override
  Database get database => hiveDatabase;

  @override
  AccountListProperties copyWith({
    String? lexoRank,
    bool? shouldReverseOrder,
    bool? shouldStackDone,
    ItemsOrdering? itemsOrdering,
  }) {
    return HiveAccountListProperties(
      hiveDatabase: hiveDatabase,
      hiveStoreAccountListProperties: hiveStoreAccountListProperties,
      lexoRank: lexoRank,
      shouldReverseOrder: shouldReverseOrder,
      shouldStackDone: shouldStackDone,
      itemsOrderingIndex: itemsOrdering?.index,
    );
  }

  @override
  Future<void> save() {
    hiveStoreAccountListProperties.hiveLexoRank = lexoRank;
    hiveStoreAccountListProperties.hiveShouldReverseOrder = shouldReverseOrder;
    hiveStoreAccountListProperties.hiveShouldStackDone = shouldStackDone;
    hiveStoreAccountListProperties.hiveItemsOrderingIndex = itemsOrderingIndex;
    return hiveStoreAccountListProperties.save().then((_) => notify(EventType.edit));
  }

  @override
  Future<void> delete() async {
    final account = database.getAccount(userLocalId)!;
    final hiveAccountProperties =
        hiveDatabase.getAccountProperties(account.accountPropertiesLocalId!)!;
    final hiveStoreAccountProperties = hiveAccountProperties.hiveStoreAccountProperties;

    hiveStoreAccountProperties.hiveAccountListPropertiesLocalIds.removeWhere((id) => id == localId);
    await hiveStoreAccountProperties
        .save()
        .then((_) => hiveAccountProperties.notify(EventType.edit));

    await hiveStoreAccountListProperties.delete().then((_) => notify(EventType.delete));
  }
}
