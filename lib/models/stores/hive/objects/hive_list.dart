import 'package:hive/hive.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/objects/list.dart';
import 'package:open_items/models/stores/hive/hive_database.dart';
import 'package:open_items/models/stores/hive/objects/hive_item.dart';

part 'hive_list.g.dart';

abstract class HiveStoreCollection {
  List<String> get hiveItemsLocalIds;
  Future<void> save();
}

@HiveType(typeId: 3)
class HiveStoreListe with HiveObjectMixin implements HiveStoreCollection {
  @HiveField(0)
  String hiveServerId;

  @HiveField(1)
  final String hiveOwnerAccountLocalId;

  @HiveField(2)
  String hiveTitle;

  @HiveField(3)
  int hiveTypeIndex;

  @HiveField(4)
  int hiveCreationTime;

  @HiveField(5)
  int hiveEditionTime;

  @override
  @HiveField(6)
  List<String> hiveItemsLocalIds;

  HiveStoreListe({
    required this.hiveServerId,
    required this.hiveOwnerAccountLocalId,
    required this.hiveTitle,
    required this.hiveTypeIndex,
    required this.hiveCreationTime,
    required this.hiveEditionTime,
    required this.hiveItemsLocalIds,
  });
}

class HiveListe extends Liste {
  final HiveStoreListe hiveStoreList;
  final HiveDatabase hiveDatabase;

  // Database
  @override
  final String localId;
  @override
  final String serverId;

  // Immutable
  @override
  final String ownerAccountId;
  @override
  final DateTime creationTime;
  @override
  final DateTime editionTime;

  // Mutable
  @override
  final String title;
  @override
  final int typeIndex;

  HiveListe({
    required this.hiveDatabase,
    required this.hiveStoreList,
    String? title,
    int? typeIndex,
    String? content,
  })  : title = title ?? hiveStoreList.hiveTitle,
        typeIndex = typeIndex ?? hiveStoreList.hiveTypeIndex,
        localId = hiveStoreList.key,
        serverId = hiveStoreList.hiveServerId,
        ownerAccountId = hiveStoreList.hiveOwnerAccountLocalId,
        creationTime =
            DateTime.fromMillisecondsSinceEpoch(hiveStoreList.hiveCreationTime),
        editionTime =
            DateTime.fromMillisecondsSinceEpoch(hiveStoreList.hiveEditionTime);

  @override
  Database get database => hiveDatabase;

  @override
  List<Item> get items {
    return hiveStoreList.hiveItemsLocalIds
        .map((itemId) => HiveItem(
              hiveDatabase: hiveDatabase,
              hiveStoreItem: hiveDatabase.itemsBox.get(itemId)!,
            ))
        .toList();
  }

  @override
  Liste copyWith({
    String? title,
    CollectionType? type,
  }) {
    return HiveListe(
      hiveDatabase: hiveDatabase,
      hiveStoreList: hiveStoreList,
      title: title,
      typeIndex: type?.index,
    );
  }

  @override
  Future<void> save() {
    hiveStoreList.hiveTitle = title;
    hiveStoreList.hiveTypeIndex = typeIndex;
    hiveStoreList.hiveEditionTime = DateTime.now().millisecondsSinceEpoch;
    return hiveStoreList.save().then((_) => notify(EventType.edit));
  }

  @override
  Future<void> delete() async {
    for (final item in items) {
      await item.delete();
    }

    final ownerAccount = database.getAccount(ownerAccountId)!;
    if (ownerAccount.isLocal) {
      final accountProperties =
          hiveDatabase.getAccountProperties(ownerAccount.accountPropertiesId!)!;
      final listProperties = accountProperties.listsPropertiesIds
          .map(database.getAccountListProperties)
          .where((lp) => lp!.listId == localId)
          .first!;
      await listProperties.delete();
    }

    await hiveStoreList.delete().then((_) => notify(EventType.delete));
  }
}
