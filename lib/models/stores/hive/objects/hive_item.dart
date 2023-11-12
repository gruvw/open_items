import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/stores/hive/hive_database.dart';
import 'package:open_items/models/stores/hive/objects/hive_list.dart';

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

  @HiveField(8)
  String hiveListLocalId;

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
    required this.hiveListLocalId,
    required this.hiveParentLocalId,
    required this.hiveItemsLocalIds,
  });
}

class HiveItem extends Item {
  final HiveDatabase hiveDatabase;
  final HiveStoreItem hiveStoreItem;

  HiveItem({
    required this.hiveDatabase,
    required this.hiveStoreItem,
  });

  @override
  Database get database => hiveDatabase;

  @override
  String get localId => hiveStoreItem.key;

  @override
  String get serverId => hiveStoreItem.hiveServerId;

  @override
  String get text => hiveStoreItem.hiveText;

  @override
  set text(String newText) {
    hiveStoreItem.hiveText = newText;
    hiveStoreItem.save();
  }

  @override
  int get typeIndex => hiveStoreItem.hiveTypeIndex;

  @override
  set typeIndex(int newTypeIndex) {
    hiveStoreItem.hiveTypeIndex = newTypeIndex;
    hiveStoreItem.save();
  }

  @override
  DateTime get creationTime =>
      DateTime.fromMillisecondsSinceEpoch(hiveStoreItem.hiveCreationTime);

  @override
  DateTime get editionTime =>
      DateTime.fromMillisecondsSinceEpoch(hiveStoreItem.hiveEditionTime);

  @override
  set editionTime(DateTime newEditionTime) {
    hiveStoreItem.hiveEditionTime = newEditionTime.millisecondsSinceEpoch;
    hiveStoreItem.save();
  }

  @override
  DateTime get doneTime =>
      DateTime.fromMillisecondsSinceEpoch(hiveStoreItem.hiveDoneTime);

  @override
  set doneTime(DateTime newDoneTime) {
    hiveStoreItem.hiveDoneTime = newDoneTime.millisecondsSinceEpoch;
    hiveStoreItem.save();
  }

  @override
  String get lexoRank => hiveStoreItem.hiveLexoRank;

  @override
  set lexoRank(String newLexoRank) {
    hiveStoreItem.hiveLexoRank = newLexoRank;
    hiveStoreItem.save();
  }

  @override
  bool get isDone => hiveStoreItem.hiveIsDone;

  @override
  set isDone(bool newIsDone) {
    hiveStoreItem.hiveIsDone = newIsDone;
    hiveStoreItem.save();
  }

  @override
  bool get isFirstLevel =>
      hiveStoreItem.hiveListLocalId == hiveStoreItem.hiveParentLocalId;

  @override
  String get listId {
    return hiveStoreItem.hiveListLocalId;
  }

  @override
  Collection get parent {
    if (isFirstLevel) {
      return database.getListe(listId)!;
    }

    final hiveStoreParentItem =
        hiveDatabase.itemsBox.get(hiveStoreItem.hiveParentLocalId)!;

    return HiveItem(
      hiveDatabase: hiveDatabase,
      hiveStoreItem: hiveStoreParentItem,
    );
  }

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
  Future<void> delete() async {
    for (final item in items) {
      await item.delete();
    }

    final hiveStoreList = hiveDatabase.getListe(listId)!.hiveStoreList;
    hiveStoreList.hiveItemsLocalIds.removeWhere((itemId) => itemId == localId);
    await hiveStoreList.save();

    await hiveStoreItem.delete();
  }

  @override
  Future<void> save() {
    // TODO: implement save
    throw UnimplementedError();
  }
}
