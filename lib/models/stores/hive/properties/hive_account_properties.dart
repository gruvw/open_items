import 'package:hive/hive.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/models/properties/account_properties.dart';
import 'package:open_items/models/stores/hive/hive_database.dart';

part 'hive_account_properties.g.dart';

@HiveType(typeId: 4)
class HiveStoreAccountProperties with HiveObjectMixin {
  @HiveField(0)
  String hiveAccountLocalId;

  @HiveField(1)
  int hiveListsOrderingIndex;

  @HiveField(2)
  bool hiveShouldReverseOrder;

  @HiveField(3)
  List<String> hiveAccountListPropertiesLocalIds;

  HiveStoreAccountProperties({
    required this.hiveAccountLocalId,
    required this.hiveListsOrderingIndex,
    required this.hiveShouldReverseOrder,
    required this.hiveAccountListPropertiesLocalIds,
  });
}

class HiveAccountProperties extends AccountProperties {
  final HiveStoreAccountProperties hiveStoreAccountProperties;
  final HiveDatabase hiveDatabase;

  // Database
  @override
  final String localId;

  // Immutable (not with copyWith)
  @override
  final String accountLocalId;
  @override
  final List<String> listsPropertiesLocalIds;

  // Mutable
  @override
  final int listsOrderingIndex;
  @override
  final bool shouldReverseOrder;

  HiveAccountProperties({
    required this.hiveDatabase,
    required this.hiveStoreAccountProperties,
    int? listsOrderingIndex,
    bool? shouldReverseOrder,
  })  : listsOrderingIndex =
            listsOrderingIndex ?? hiveStoreAccountProperties.hiveListsOrderingIndex,
        localId = hiveStoreAccountProperties.key,
        accountLocalId = hiveStoreAccountProperties.hiveAccountLocalId,
        listsPropertiesLocalIds =
            List.from(hiveStoreAccountProperties.hiveAccountListPropertiesLocalIds),
        shouldReverseOrder =
            shouldReverseOrder ?? hiveStoreAccountProperties.hiveShouldReverseOrder;

  @override
  Database get database => hiveDatabase;

  @override
  AccountProperties copyWith({
    ListsOrdering? listsOrdering,
    bool? shouldReverseOrder,
  }) {
    return HiveAccountProperties(
      hiveDatabase: hiveDatabase,
      hiveStoreAccountProperties: hiveStoreAccountProperties,
      listsOrderingIndex: listsOrdering?.index,
      shouldReverseOrder: shouldReverseOrder,
    );
  }

  @override
  Future<void> save() {
    hiveStoreAccountProperties.hiveListsOrderingIndex = listsOrdering.index;
    hiveStoreAccountProperties.hiveShouldReverseOrder = shouldReverseOrder;
    return hiveStoreAccountProperties.save().then((_) => notify(EventType.edit));
  }

  @override
  Future<void> delete() async {
    final account = database.getAccount(accountLocalId)!;

    for (final listPropertiesLocalId in listsPropertiesLocalIds) {
      final listProperties = database.getAccountListProperties(listPropertiesLocalId)!;
      final list = database.getListe(listProperties.listLocalId)!;

      if (account.isOwnerOf(list)) {
        await list.delete();
      } else {
        await listProperties.delete();
      }
    }

    await hiveStoreAccountProperties.delete().then((_) => notify(EventType.delete));
  }
}
