import 'package:hive_flutter/hive_flutter.dart' hide HiveList;
import 'package:nanoid/nanoid.dart';
import 'package:open_items/utils/lang.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/objects/list.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/models/properties/account_properties.dart';
import 'package:open_items/models/stores/hive/objects/hive_account.dart';
import 'package:open_items/models/stores/hive/objects/hive_item.dart';
import 'package:open_items/models/stores/hive/objects/hive_list.dart';
import 'package:open_items/models/stores/hive/properties/hive_account_list_properties.dart';
import 'package:open_items/models/stores/hive/properties/hive_account_properties.dart';

const String _hiveDatabaseSubdir = "Open-Items_hive";

class HiveDatabase extends Database {
  static const String _accountsBoxName = "accounts";
  static const String _listsBoxName = "lists";
  static const String _itemsBoxName = "items";
  static const String _accountPropertiesBoxName = "account_properties";
  static const String _accountListPropertiesBoxName = "account_list_properties";

  HiveDatabase();

  late final Box<HiveStoreAccount> accountsBox;
  late final Box<HiveStoreList> listsBox;
  late final Box<HiveStoreItem> itemsBox;
  late final Box<HiveStoreAccountProperties> accountPropertiesBox;
  late final Box<HiveStoreAccountListProperties> accountListPropertiesBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter(_hiveDatabaseSubdir);

    Hive.registerAdapter(HiveStoreAccountAdapter());
    Hive.registerAdapter(HiveStoreListAdapter());
    Hive.registerAdapter(HiveStoreItemAdapter());
    Hive.registerAdapter(HiveStoreAccountPropertiesAdapter());
    Hive.registerAdapter(HiveStoreAccountListPropertiesAdapter());

    accountsBox =
        await Hive.openBox<HiveStoreAccount>(HiveDatabase._accountsBoxName);
    listsBox = await Hive.openBox<HiveStoreList>(HiveDatabase._listsBoxName);
    itemsBox = await Hive.openBox<HiveStoreItem>(HiveDatabase._itemsBoxName);
    accountPropertiesBox = await Hive.openBox<HiveStoreAccountProperties>(
        HiveDatabase._accountPropertiesBoxName);
    accountListPropertiesBox =
        await Hive.openBox<HiveStoreAccountListProperties>(
            HiveDatabase._accountListPropertiesBoxName);
  }

  @override
  Future<Account> createAccount({
    required String serverId,
    required String name,
    required String server,
    required bool isLocal,
    ListsOrdering? listsOrdering,
  }) async {
    String accountLocalId = nanoid();

    String? propertiesLocalId;
    if (isLocal) {
      final properties = HiveStoreAccountProperties(
        hiveAccountLocalId: accountLocalId,
        hiveListsOrderingIndex: listsOrdering!.index,
        hiveAccountListPropertiesLocalIds: [],
      );
      propertiesLocalId = nanoid();
      await accountPropertiesBox.put(propertiesLocalId, properties);
    }

    final hiveStoreAccount = HiveStoreAccount(
      hiveServerId: serverId,
      hiveServer: server,
      hiveName: name,
      hiveAccountPropertiesLocalId:
          propertiesLocalId ?? CoreValues.unknownLocalId,
    );
    await accountsBox.put(accountLocalId, hiveStoreAccount);

    return HiveAccount(
      hiveDatabase: this,
      hiveStoreAccount: hiveStoreAccount,
    );
  }

  @override
  Future<Liste> createListe({
    required Account owner,
    required String listServerId,
    required String title,
    required CollectionType type,
    required DateTime creationTime,
    required DateTime editionTime,
  }) async {
    final hiveStoreList = HiveStoreList(
      hiveServerId: listServerId,
      hiveOwnerAccountLocalId: owner.localId,
      hiveTitle: title,
      hiveTypeIndex: type.index,
      hiveCreationTime: creationTime.millisecondsSinceEpoch,
      hiveEditionTime: editionTime.millisecondsSinceEpoch,
      hiveItemsLocalIds: [],
    );
    await listsBox.put(nanoid(), hiveStoreList);

    final list = HiveList(
      hiveDatabase: this,
      hiveStoreList: hiveStoreList,
    );

    return list;
  }

  @override
  Future<AccountListProperties> createAccountListProperties({
    required Account user,
    required String serverId,
    required String listLocalId,
    required ItemsOrdering itemsOrdering,
    required String lexoRank,
    required bool shouldReverseOrder,
    required bool shouldStackDone,
  }) async {
    final hiveStoreAccountListProperties = HiveStoreAccountListProperties(
      hiveServerId: serverId,
      hiveAccountLocalId: user.localId,
      hiveListLocalId: listLocalId,
      hiveItemsOrderingIndex: itemsOrdering.index,
      hiveLexoRank: lexoRank,
      hiveShouldReverseOrder: shouldReverseOrder,
      hiveShouldStackDone: shouldStackDone,
    );
    await accountListPropertiesBox.put(
        nanoid(), hiveStoreAccountListProperties);

    final hiveUserProperties = user.properties! as HiveAccountProperties;
    final hiveStoreUserProperties =
        hiveUserProperties.hiveStoreAccountProperties;
    hiveStoreUserProperties.hiveAccountListPropertiesLocalIds
        .add(hiveStoreAccountListProperties.key);
    await hiveStoreUserProperties.save();

    return HiveAccountListProperties(
      hiveDatabase: this,
      hiveStoreAccountListProperties: hiveStoreAccountListProperties,
    );
  }

  @override
  Future<Item> createItem({
    required String serverId,
    required Collection parent,
    required String text,
    required CollectionType type,
    required String lexoRank,
    required DateTime creationTime,
    required DateTime editionTime,
    required DateTime doneTime,
    required bool isDone,
  }) async {
    final hiveStoreItem = HiveStoreItem(
      hiveServerId: serverId,
      hiveText: text,
      hiveTypeIndex: type.index,
      hiveCreationTime: creationTime.millisecondsSinceEpoch,
      hiveEditionTime: editionTime.millisecondsSinceEpoch,
      hiveDoneTime: doneTime.millisecondsSinceEpoch,
      hiveLexoRank: lexoRank,
      hiveIsDone: isDone,
      hiveListLocalId: parent.list.localId,
      hiveParentLocalId: parent.localId,
      hiveItemsLocalIds: [],
    );
    await itemsBox.put(nanoid(), hiveStoreItem);

    // https://github.com/dart-lang/language/issues/1618
    final HiveStoreCollection hiveStoreParent;
    if (parent is HiveList) {
      hiveStoreParent = parent.hiveStoreList;
    } else {
      hiveStoreParent = (parent as HiveItem).hiveStoreItem;
    }
    hiveStoreParent.hiveItemsLocalIds.add(hiveStoreItem.key);
    await hiveStoreParent.save();

    return HiveItem(
      hiveDatabase: this,
      hiveStoreItem: hiveStoreItem,
    );
  }

  @override
  HiveAccount? getLocalAccount(String accountId) {
    final accountStore = accountsBox.get(accountId);
    final account = accountStore
        .map((a) => HiveAccount(hiveDatabase: this, hiveStoreAccount: a));

    if (account == null || !account.isLocal) {
      return null;
    }

    return account;
  }

  @override
  List<Account> getLocalAccounts() {
    return accountsBox.values
        .map((hsa) => HiveAccount(
              hiveDatabase: this,
              hiveStoreAccount: hsa,
            ))
        .where((account) => account.isLocal)
        .toList();
  }
}
