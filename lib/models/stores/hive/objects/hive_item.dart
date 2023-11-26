import 'package:hive_flutter/hive_flutter.dart' hide HiveCollection;
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/stores/hive/hive_database.dart';
import 'package:open_items/models/stores/hive/objects/hive_list.dart';
import 'package:open_items/utils/lang.dart';

part 'hive_item.g.dart';

@HiveType(typeId: 5)
class HiveStoreItem with HiveObjectMixin implements HiveStoreCollection {
  @HiveField(0)
  String hiveServerId;

  @HiveField(1)
  String hiveText;

  @HiveField(2)
  int hiveTypeIndex;

  @HiveField(3)
  final int hiveCreationTime;

  @HiveField(4)
  int hiveEditionTime;

  @HiveField(5)
  int hiveDoneTime;

  @HiveField(6)
  String hiveLexoRank;

  @HiveField(7)
  bool hiveIsDone;

  @HiveField(9)
  String hiveParentLocalId;

  @override
  @HiveField(10)
  List<String> hiveItemsLocalIds;

  HiveStoreItem({
    required this.hiveServerId,
    required this.hiveText,
    required this.hiveTypeIndex,
    required this.hiveCreationTime,
    required this.hiveEditionTime,
    required this.hiveDoneTime,
    required this.hiveLexoRank,
    required this.hiveIsDone,
    required this.hiveParentLocalId,
    required this.hiveItemsLocalIds,
  });
}

class HiveItem extends Item with HiveCollection {
  final HiveDatabase hiveDatabase;
  final HiveStoreItem hiveStoreItem;

  // Database
  @override
  final String localId;
  @override
  final String serverId;

  // Immutable (not with copyWith)
  @override
  final String parentId;
  @override
  final DateTime creationTime;
  @override
  final DateTime editionTime;

  // Mutable
  @override
  final String text;
  @override
  final int typeIndex;
  @override
  final String lexoRank;
  @override
  final bool isDone;
  @override
  final DateTime doneTime;

  HiveItem({
    required this.hiveDatabase,
    required this.hiveStoreItem,
    String? text,
    int? typeIndex,
    String? lexoRank,
    bool? isDone,
    DateTime? doneTime,
  })  : localId = hiveStoreItem.key,
        serverId = hiveStoreItem.hiveServerId,
        parentId = hiveStoreItem.hiveParentLocalId,
        creationTime =
            DateTime.fromMillisecondsSinceEpoch(hiveStoreItem.hiveCreationTime),
        editionTime =
            DateTime.fromMillisecondsSinceEpoch(hiveStoreItem.hiveEditionTime),
        text = text ?? hiveStoreItem.hiveText,
        typeIndex = typeIndex ?? hiveStoreItem.hiveTypeIndex,
        lexoRank = lexoRank ?? hiveStoreItem.hiveLexoRank,
        isDone = isDone ?? hiveStoreItem.hiveIsDone,
        doneTime = doneTime ??
            DateTime.fromMillisecondsSinceEpoch(hiveStoreItem.hiveDoneTime);

  @override
  HiveDatabase get database => hiveDatabase;

  @override
  HiveStoreCollection get collectionStore => hiveStoreItem;

  @override
  Collection get parent =>
      database.getCollection(hiveStoreItem.hiveParentLocalId)!;

  @override
  List<HiveItem> get items {
    return hiveStoreItem.hiveItemsLocalIds
        .map((itemId) => HiveItem(
              hiveDatabase: hiveDatabase,
              hiveStoreItem: hiveDatabase.itemsBox.get(itemId)!,
            ))
        .toList();
  }

  @override
  Item copyWith({
    String? text,
    CollectionType? type,
    String? lexoRank,
    bool? isDone,
  }) {
    return HiveItem(
      hiveDatabase: database,
      hiveStoreItem: hiveStoreItem,
      text: text,
      typeIndex: type?.index,
      lexoRank: lexoRank,
      isDone: isDone,
      doneTime: isDone.map((_) => DateTime.now()),
    );
  }

  @override
  Future<void> save() {
    hiveStoreItem.hiveText = text;
    hiveStoreItem.hiveTypeIndex = typeIndex;
    hiveStoreItem.hiveEditionTime = DateTime.now().millisecondsSinceEpoch;
    hiveStoreItem.hiveLexoRank = lexoRank;
    hiveStoreItem.hiveIsDone = isDone;
    hiveStoreItem.hiveDoneTime = doneTime.millisecondsSinceEpoch;
    return hiveStoreItem.save().then((_) => notify(EventType.edit));
  }

  @override
  Future<void> delete() async {
    for (final item in items) {
      await item.delete();
    }

    final hiveParent = hiveDatabase.getCollection(parentId)!;
    final hiveStoreParent = (hiveParent as HiveCollection).collectionStore;
    hiveStoreParent.hiveItemsLocalIds
        .removeWhere((itemId) => itemId == localId);
    await hiveStoreParent.save().then((_) => hiveParent.notify(EventType.edit));

    await hiveStoreItem.delete().then((_) => notify(EventType.delete));
  }
}
