import 'package:hive/hive.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/account_properties.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';

part 'hive_account.g.dart';

@HiveType(typeId: 1)
class HiveStoreAccount with HiveObjectMixin {
  @HiveField(0)
  final String hiveId;

  @HiveField(1)
  final String hiveServer;

  @HiveField(2)
  String hiveName;

  @HiveField(3)
  int hiveListsOrderingIndex;

  @HiveField(4)
  List<String> hiveListIds;

  HiveStoreAccount({
    required this.hiveId,
    required this.hiveServer,
    required this.hiveName,
    required this.hiveListsOrderingIndex,
    required this.hiveListIds,
  });
}

class HiveAccount extends Account {
  final HiveStoreAccount hiveStoreAccount;
  final HiveDatabase hiveDatabase;

  HiveAccount({
    required this.hiveDatabase,
    required this.hiveStoreAccount,
  });

  @override
  Database get database => hiveDatabase;

  @override
  String get id => hiveStoreAccount.hiveId;

  @override
  String get server => hiveStoreAccount.hiveServer;

  @override
  String get name => hiveStoreAccount.hiveName;

  @override
  set name(String newName) {
    hiveStoreAccount.hiveName = newName;
    hiveStoreAccount.save();
  }

  @override
  int get listsOrderingIndex => hiveStoreAccount.hiveListsOrderingIndex;

  @override
  set listsOrderingIndex(int newListsOrderingIndex) {
    hiveStoreAccount.hiveListsOrderingIndex = newListsOrderingIndex;
    hiveStoreAccount.save();
  }

  @override
  // TODO: implement lists
  List<Liste> get lists => throw UnimplementedError();

  @override
  AccountListProperties listProperties(Liste list) {
    // TODO: implement listProperties
    throw UnimplementedError();
  }

  @override
  AccountItemProperties itemProperties(Item item) {
    // TODO: implement itemProperties
    throw UnimplementedError();
  }

  @override
  void delete() {
    for (final list in lists) {
      list.delete();
    }
    hiveStoreAccount.delete();
  }
}
