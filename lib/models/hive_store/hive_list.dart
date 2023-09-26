import 'package:hive/hive.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_account.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';

part 'hive_list.g.dart';

@HiveType(typeId: 3)
class HiveStoreList with HiveObjectMixin {
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

  @HiveField(6)
  List<String> hiveItemLocalIds;

  HiveStoreList({
    required this.hiveServerId,
    required this.hiveOwnerAccountLocalId,
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
  Account get ownerAccount {
    final hiveStoreAccount =
        hiveDatabase.accountsBox.get(hiveStoreList.hiveOwnerAccountLocalId)!;

    return HiveAccount(
      hiveDatabase: hiveDatabase,
      hiveStoreAccount: hiveStoreAccount,
    );
  }

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
  DateTime get creationTime =>
      DateTime.fromMillisecondsSinceEpoch(hiveStoreList.hiveCreationTime);

  @override
  DateTime get editionTime =>
      DateTime.fromMillisecondsSinceEpoch(hiveStoreList.hiveEditionTime);

  @override
  set editionTime(DateTime newEditionTime) {
    hiveStoreList.hiveEditionTime = newEditionTime.millisecondsSinceEpoch;
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

    if (ownerAccount.isLocal) {
      ownerAccount.properties!.listsProperties
          .where((lp) => lp.list.localId == localId)
          .firstOrNull!
          .delete();
    }

    hiveStoreList.delete();
  }
}
