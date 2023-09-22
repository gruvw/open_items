import 'package:hive_flutter/hive_flutter.dart';
import 'package:nanoid/nanoid.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/collection.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_account.dart';
import 'package:open_items/models/hive_store/properties/hive_account_item_properties.dart';
import 'package:open_items/models/hive_store/properties/hive_account_list_properties.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';

class HiveDatabase extends Database {
  static const String _accountListPropertiesBoxName = "account_list_properties";
  static const String _accountItemPropertiesBoxName = "account_item_properties";
  static const String _accountsBoxName = "accounts";

  HiveDatabase();

  late final Box<HiveStoreAccountListProperties> accountListPropertiesBox;
  late final Box<HiveStoreAccountItemProperties> accountItemPropertiesBox;
  late final Box<HiveStoreAccount> accountsBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(HiveStoreAccountListPropertiesAdapter());
    Hive.registerAdapter(HiveStoreAccountItemPropertiesAdapter());
    Hive.registerAdapter(HiveStoreAccountAdapter());

    accountListPropertiesBox = await Hive.openBox<HiveStoreAccountListProperties>(
        HiveDatabase._accountListPropertiesBoxName);
    accountItemPropertiesBox = await Hive.openBox<HiveStoreAccountItemProperties>(
        HiveDatabase._accountItemPropertiesBoxName);
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
