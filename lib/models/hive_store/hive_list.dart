import 'package:hive/hive.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';

part 'hive_list.g.dart';

@HiveType(typeId: 4)
class HiveStoreList with HiveObjectMixin {
  @HiveField(0)
  String hiveServerId;

  @HiveField(1)
  final String hiveOwnerAccount;

  @HiveField(2)
  String hiveTitle;

  @HiveField(3)
  int hiveTypeIndex;

  @HiveField(4)
  int hiveCreationTime;

  @HiveField(5)
  int hiveEditionTime;

  @HiveField(6)
  List<String> hiveItemLocalIds;

  HiveStoreList({
    required this.hiveServerId,
    required this.hiveOwnerAccount,
    required this.hiveTitle,
    required this.hiveTypeIndex,
    required this.hiveCreationTime,
    required this.hiveEditionTime,
    required this.hiveItemLocalIds,
  });
}

class HiveList extends Liste {
  final HiveStoreList hiveStoreList;
  final HiveDatabase hiveDatabase;

  HiveList({
    required this.hiveDatabase,
    required this.hiveStoreList,
  });

  @override
  Database get database => hiveDatabase;

  @override
  String get localId => hiveStoreList.key;

  @override
  String get serverId => hiveStoreList.hiveServerId;

  @override
  String get ownerAccountId => hiveStoreList.hiveOwnerAccount;

  @override
  String get title => hiveStoreList.hiveTitle;

  @override
  set title(String newTitle) {
    hiveStoreList.hiveTitle = newTitle;
    hiveStoreList.save();
  }

  @override
  int get typeIndex => hiveStoreList.hiveTypeIndex;

  @override
  set typeIndex(int newTypeIndex) {
    hiveStoreList.hiveTypeIndex = newTypeIndex;
    hiveStoreList.save();
  }

  @override
  int get creationTime => hiveStoreList.hiveCreationTime;

  @override
  int get editionTime => hiveStoreList.hiveEditionTime;

  @override
  set editionTime(int newEditionTime) {
    hiveStoreList.hiveEditionTime = newEditionTime;
    hiveStoreList.save();
  }

  @override
  List<Item> get items {
    // TODO
    hiveStoreList.hiveItemLocalIds.map((id) => hiveDatabase.itemsBox.get(id));
  }

  @override
  void delete() {
    for (final item in items) {
      item.delete();
    }

    hiveStoreList.delete();
  }
}
