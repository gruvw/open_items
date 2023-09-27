import 'package:hive_flutter/hive_flutter.dart' hide HiveList;
import 'package:open_items/models/collection.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/hive_store/hive_list.dart';
import 'package:open_items/models/item.dart';

@HiveType(typeId: 5)
class HiveStoreItem with HiveObjectMixin {
  @HiveField(0)
  String hiveServerId;

  @HiveField(1)
  String hiveText;

  @HiveField(2)
  final int hiveCreationTime;

  @HiveField(3)
  int hiveEditionTime;

  @HiveField(4)
  int hiveDoneTime;

  @HiveField(5)
  String hiveLexoRank;

  @HiveField(6)
  bool hiveIsDone;

  @HiveField(7)
  String hiveListLocalId;

  @HiveField(8)
  String hiveParentLocalId;

  @HiveField(9)
  List<String> hiveItemsLocalIds;

  HiveStoreItem({
    required this.hiveServerId,
    required this.hiveText,
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
  HiveList get list {
    final hiveStoreList =
        hiveDatabase.listsBox.get(hiveStoreItem.hiveListLocalId)!;

    return HiveList(
      hiveDatabase: hiveDatabase,
      hiveStoreList: hiveStoreList,
    );
  }

  @override
  Collection get parent {
    if (isFirstLevel) {
      return list;
    }

    final hiveStoreParentItem =
        hiveDatabase.itemsBox.get(hiveStoreItem.hiveParentLocalId);

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
  void delete() {
    for (final item in items) {
      item.delete();
    }

    final hiveStoreList = list.hiveStoreList;
    hiveStoreList.hiveItemLocalIds.removeWhere((itemId) => itemId == localId);
    hiveStoreList.save();

    hiveStoreItem.delete();
  }
}
