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
  List<String> hiveAccountListPropertiesLocalIds;

  HiveStoreAccountProperties({
    required this.hiveAccountLocalId,
    required this.hiveListsOrderingIndex,
    required this.hiveAccountListPropertiesLocalIds,
  });
}

class HiveAccountProperties extends AccountProperties {
  final HiveStoreAccountProperties hiveStoreAccountProperties;
  final HiveDatabase hiveDatabase;

  // Database
  @override
  final String localId;

  // Immutable
  @override
  final String accountId;
  @override
  final List<String> listsPropertiesIds;

  // Mutable
  @override
  final int listsOrderingIndex;

  HiveAccountProperties({
    required this.hiveDatabase,
    required this.hiveStoreAccountProperties,
    int? listsOrderingIndex,
  })  : listsOrderingIndex = listsOrderingIndex ??
            hiveStoreAccountProperties.hiveListsOrderingIndex,
        localId = hiveStoreAccountProperties.key,
        accountId = hiveStoreAccountProperties.hiveAccountLocalId,
        listsPropertiesIds = List.from(
            hiveStoreAccountProperties.hiveAccountListPropertiesLocalIds);

  @override
  Database get database => hiveDatabase;

  @override
  AccountProperties copyWith({ListsOrdering? listsOrdering}) {
    return HiveAccountProperties(
      hiveDatabase: hiveDatabase,
      hiveStoreAccountProperties: hiveStoreAccountProperties,
      listsOrderingIndex: listsOrdering?.index,
    );
  }

  @override
  Future<void> save() {
    hiveStoreAccountProperties.hiveListsOrderingIndex = listsOrdering.index;
    return hiveStoreAccountProperties
        .save()
        .then((_) => notify(EventType.edit));
  }

  @override
  Future<void> delete() async {
    final account = database.getAccount(accountId)!;

    for (final listPropertiesId in listsPropertiesIds) {
      final listProperties =
          database.getAccountListProperties(listPropertiesId)!;
      final list = database.getListe(listProperties.listId)!;

      if (account.isOwnerOf(list)) {
        await list.delete();
      } else {
        await listProperties.delete();
      }
    }

    await hiveStoreAccountProperties
        .delete()
        .then((_) => notify(EventType.delete));
  }
}
