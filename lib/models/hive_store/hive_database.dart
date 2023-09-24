import 'package:hive_flutter/hive_flutter.dart';
import 'package:nanoid/nanoid.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/collection.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_account.dart';
import 'package:open_items/models/hive_store/hive_list.dart';
import 'package:open_items/models/hive_store/properties/hive_account_item_properties.dart';
import 'package:open_items/models/hive_store/properties/hive_account_list_properties.dart';
import 'package:open_items/models/hive_store/properties/hive_account_properties.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';

class HiveDatabase extends Database {
  static const String _accountsBoxName = "accounts";
  static const String _listsBoxName = "lists";
  static const String _itemsBoxName = "items";
  static const String _accountPropertiesBoxName = "account_properties";
  static const String _accountListPropertiesBoxName = "account_list_properties";
  static const String _accountItemPropertiesBoxName = "account_item_properties";

  HiveDatabase();

  late final Box<HiveStoreAccount> accountsBox;
  late final Box<HiveStoreList> listsBox;
  late final Box<HiveStoreItem> itemsBox;
  late final Box<HiveStoreAccountProperties> accountPropertiesBox;
  late final Box<HiveStoreAccountListProperties> accountListPropertiesBox;
  late final Box<HiveStoreAccountItemProperties> accountItemPropertiesBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(HiveStoreAccountAdapter());
    Hive.registerAdapter(HiveStoreListAdapter());
    Hive.registerAdapter(HiveStoreItemAdapter());
    Hive.registerAdapter(HiveStoreAccountPropertiesAdapter());
    Hive.registerAdapter(HiveStoreAccountListPropertiesAdapter());
    Hive.registerAdapter(HiveStoreAccountItemPropertiesAdapter());

    accountsBox =
        await Hive.openBox<HiveStoreAccount>(HiveDatabase._accountsBoxName);
    listsBox = await Hive.openBox<HiveStoreList>(HiveDatabase._listsBoxName);
    itemsBox = await Hive.openBox<HiveStoreItem>(HiveDatabase._itemsBoxName);
    accountPropertiesBox = await Hive.openBox<HiveStoreAccountProperties>(
        HiveDatabase._accountPropertiesBoxName);
    accountListPropertiesBox =
        await Hive.openBox<HiveStoreAccountListProperties>(
            HiveDatabase._accountListPropertiesBoxName);
    accountItemPropertiesBox =
        await Hive.openBox<HiveStoreAccountItemProperties>(
            HiveDatabase._accountItemPropertiesBoxName);
  }

  @override
  Account createAccount({
    required String serverId,
    required String name,
    required String server,
    required bool isLocal,
    int? listsOrderingIndex,
  }) {
    String? propertiesLocalId;
    if (isLocal) {
      final properties = HiveStoreAccountProperties(
        hiveListsOrderingIndex: listsOrderingIndex!,
        hiveListLocalIds: [],
      );
      propertiesLocalId = nanoid();
      accountPropertiesBox.put(propertiesLocalId, properties);
    }

    final hiveStoreAccount = HiveStoreAccount(
      hiveServerId: serverId,
      hiveServer: server,
      hiveName: name,
      hiveAccountPropertiesLocalId: propertiesLocalId ?? ValuesTheme.unknownLocalId,
    );
    accountsBox.put(nanoid(), hiveStoreAccount);

    return HiveAccount(
      hiveDatabase: this,
      hiveStoreAccount: hiveStoreAccount,
    );
  }

  @override
  Liste createListe({
    required String serverId,
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
    required String serverId,
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
