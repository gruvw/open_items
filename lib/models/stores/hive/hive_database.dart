import 'package:hive_flutter/hive_flutter.dart' hide HiveCollection;
import 'package:nanoid/nanoid.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/utils/lang.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/objects/collection.dart';
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
  late final Box<HiveStoreListe> listsBox;
  late final Box<HiveStoreItem> itemsBox;
  late final Box<HiveStoreAccountProperties> accountPropertiesBox;
  late final Box<HiveStoreAccountListProperties> accountListPropertiesBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter(_hiveDatabaseSubdir);

    Hive.registerAdapter(HiveStoreAccountAdapter());
    Hive.registerAdapter(HiveStoreListeAdapter());
    Hive.registerAdapter(HiveStoreItemAdapter());
    Hive.registerAdapter(HiveStoreAccountPropertiesAdapter());
    Hive.registerAdapter(HiveStoreAccountListPropertiesAdapter());

    accountsBox = await Hive.openBox<HiveStoreAccount>(HiveDatabase._accountsBoxName);
    listsBox = await Hive.openBox<HiveStoreListe>(HiveDatabase._listsBoxName);
    itemsBox = await Hive.openBox<HiveStoreItem>(HiveDatabase._itemsBoxName);
    accountPropertiesBox =
        await Hive.openBox<HiveStoreAccountProperties>(HiveDatabase._accountPropertiesBoxName);
    accountListPropertiesBox = await Hive.openBox<HiveStoreAccountListProperties>(
        HiveDatabase._accountListPropertiesBoxName);
  }

  @override
  Future<String> createAccount({
    required String serverId,
    required String name,
    required String server,
    required bool isLocal,
    ListsOrdering? listsOrdering,
    bool? shouldReverseOrder,
  }) async {
    String accountLocalId = nanoid();

    String? propertiesLocalId;
    if (isLocal) {
      final properties = HiveStoreAccountProperties(
        hiveAccountLocalId: accountLocalId,
        hiveListsOrderingIndex: listsOrdering!.index,
        hiveAccountListPropertiesLocalIds: [],
        hiveShouldReverseOrder: shouldReverseOrder!,
      );
      propertiesLocalId = nanoid();
      await accountPropertiesBox.put(propertiesLocalId, properties);
    }

    final hiveStoreAccount = HiveStoreAccount(
      hiveServerId: serverId,
      hiveServer: server,
      hiveName: name,
      hiveAccountPropertiesLocalId: propertiesLocalId ?? CoreValues.unknownLocalId,
    );
    await accountsBox.put(accountLocalId, hiveStoreAccount);

    return accountLocalId;
  }

  @override
  Future<String> createListe({
    required Account owner,
    required String listServerId,
    required String title,
    required CollectionType type,
    required DateTime creationTime,
    required DateTime editionTime,
  }) async {
    final hiveStoreList = HiveStoreListe(
      hiveServerId: listServerId,
      hiveOwnerAccountLocalId: owner.localId,
      hiveTitle: title,
      hiveTypeIndex: type.index,
      hiveCreationTime: creationTime.millisecondsSinceEpoch,
      hiveEditionTime: editionTime.millisecondsSinceEpoch,
      hiveItemsLocalIds: [],
    );
    final listLocalId = nanoid();
    await listsBox.put(listLocalId, hiveStoreList);

    HiveListe(
      hiveDatabase: this,
      hiveStoreList: hiveStoreList,
    ).notify(EventType.create);

    return listLocalId;
  }

  @override
  Future<String> createAccountListProperties({
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
    final accountListPropertiesLocalId = nanoid();
    await accountListPropertiesBox.put(
      accountListPropertiesLocalId,
      hiveStoreAccountListProperties,
    );

    final hiveUserProperties = getAccountProperties(user.accountPropertiesLocalId!)!;
    final hiveStoreUserProperties = hiveUserProperties.hiveStoreAccountProperties;
    hiveStoreUserProperties.hiveAccountListPropertiesLocalIds
        .add(hiveStoreAccountListProperties.key);
    await hiveUserProperties.save();

    HiveAccountListProperties(
      hiveDatabase: this,
      hiveStoreAccountListProperties: hiveStoreAccountListProperties,
    ).notify(EventType.create);

    return accountListPropertiesLocalId;
  }

  @override
  Future<String> createItem({
    required String serverId,
    required String parentLocalId,
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
      hiveParentLocalId: parentLocalId,
      hiveItemsLocalIds: [],
    );
    final itemLocalId = nanoid();
    await itemsBox.put(itemLocalId, hiveStoreItem);

    final parent = getCollection(parentLocalId)!;
    final hiveStoreParent = (parent as HiveCollection).collectionStore;
    hiveStoreParent.hiveItemsLocalIds.add(hiveStoreItem.key);
    await hiveStoreParent.save().then((_) => parent.notify(EventType.edit));

    HiveItem(
      hiveDatabase: this,
      hiveStoreItem: hiveStoreItem,
    ).notify(EventType.create);

    return itemLocalId;
  }

  @override
  List<Account> getLocalAccounts() {
    return accountsBox.values
        .map(
          (hsa) => HiveAccount(
            hiveDatabase: this,
            hiveStoreAccount: hsa,
          ),
        )
        .where((account) => account.isLocal)
        .toList();
  }

  @override
  HiveAccount? getAccount(String? accountLocalId) {
    if (accountLocalId == null) {
      return null;
    }

    final accountStore = accountsBox.get(accountLocalId);

    return accountStore.map(
      (a) => HiveAccount(
        hiveDatabase: this,
        hiveStoreAccount: a,
      ),
    );
  }

  @override
  HiveAccountProperties? getAccountProperties(String? accountPropertiesLocalId) {
    if (accountPropertiesLocalId == null) {
      return null;
    }

    final accountPropertiesStore = accountPropertiesBox.get(accountPropertiesLocalId);

    return accountPropertiesStore.map(
      (ap) => HiveAccountProperties(
        hiveDatabase: this,
        hiveStoreAccountProperties: ap,
      ),
    );
  }

  @override
  HiveAccountListProperties? getAccountListProperties(
    String? accountListPropertiesLocalId,
  ) {
    if (accountListPropertiesLocalId == null) {
      return null;
    }

    final accountListPropertiesStore = accountListPropertiesBox.get(accountListPropertiesLocalId);

    return accountListPropertiesStore.map(
      (alp) => HiveAccountListProperties(
        hiveDatabase: this,
        hiveStoreAccountListProperties: alp,
      ),
    );
  }

  @override
  HiveListe? getListe(String? listLocalId) {
    if (listLocalId == null) {
      return null;
    }

    final listStore = listsBox.get(listLocalId);

    return listStore.map(
      (l) => HiveListe(
        hiveDatabase: this,
        hiveStoreList: l,
      ),
    );
  }

  @override
  Item? getItem(String? itemLocalId) {
    if (itemLocalId == null) {
      return null;
    }

    final itemStore = itemsBox.get(itemLocalId);

    return itemStore.map(
      (i) => HiveItem(
        hiveDatabase: this,
        hiveStoreItem: i,
      ),
    );
  }
}
