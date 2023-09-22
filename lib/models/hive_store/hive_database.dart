import 'package:hive_flutter/hive_flutter.dart';
import 'package:nanoid/nanoid.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/collection.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_account.dart';
import 'package:open_items/models/hive_store/properties/hive_item_properties.dart';
import 'package:open_items/models/hive_store/properties/hive_list_properties.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';

class HiveDatabase extends Database {
  static const String _listPropertiesBoxName = "list_properties";
  static const String _itemPropertiesBoxName = "item_properties";
  static const String _accountsBoxName = "accounts";

  HiveDatabase();

  late final Box<HiveStoreListProperties> listPropertiesBox;
  late final Box<HiveStoreItemProperties> itemPropertiesBox;
  late final Box<HiveStoreAccount> accountsBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(HiveStoreListPropertiesAdapter());
    Hive.registerAdapter(HiveStoreItemPropertiesAdapter());
    Hive.registerAdapter(HiveStoreAccountAdapter());

    listPropertiesBox = await Hive.openBox<HiveStoreListProperties>(
        HiveDatabase._listPropertiesBoxName);
    itemPropertiesBox = await Hive.openBox<HiveStoreItemProperties>(
        HiveDatabase._itemPropertiesBoxName);
    accountsBox =
        await Hive.openBox<HiveStoreAccount>(HiveDatabase._accountsBoxName);
  }

  @override
  Account createAccount({
    required String name,
    required String server,
  }) {
    final hiveStoreAccount = HiveStoreAccount(
      hiveServer: server,
      hiveName: name,
      hiveListsOrderingIndex: ListsOrdering.custom.index,
      hiveListIds: [],
    );
    accountsBox.put(nanoid(), hiveStoreAccount);

    final hiveAccount = HiveAccount(
      hiveDatabase: this,
      hiveStoreAccount: hiveStoreAccount,
    );

    return hiveAccount;
  }

  @override
  Liste createListe({
    required Account account,
    required String title,
    required String position,
    required int typeIndex,
    required int orderIndex,
    required bool shouldReverseOrder,
    required bool shouldStackDone,
    required int creationTime,
    required int editionTime,
    required bool isOutOfSync,
  }) {
    // TODO: implement createListe
    throw UnimplementedError();
  }

  @override
  Item createItem({
    required Account account,
    required Collection parent,
    required String text,
    required String position,
    required bool isDone,
    required int creationTime,
    required int editionTime,
    required bool isOutOfSync,
  }) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  List<Account> getAccounts() {
    // TODO: implement getAccounts
    throw UnimplementedError();
  }
}
