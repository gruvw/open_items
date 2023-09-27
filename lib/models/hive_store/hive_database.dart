import 'package:hive_flutter/hive_flutter.dart' hide HiveList;
import 'package:nanoid/nanoid.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/collection.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_account.dart';
import 'package:open_items/models/hive_store/hive_item.dart';
import 'package:open_items/models/hive_store/hive_list.dart';
import 'package:open_items/models/hive_store/properties/hive_account_list_properties.dart';
import 'package:open_items/models/hive_store/properties/hive_account_properties.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/properties/account_list_properties.dart';

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
    await Hive.initFlutter();

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
  Account createAccount({
    required String serverId,
    required String name,
    required String server,
    required bool isLocal,
    int? listsOrderingIndex,
  }) {
    String accountLocalId = nanoid();

    String? propertiesLocalId;
    if (isLocal) {
      final properties = HiveStoreAccountProperties(
        hiveAccountLocalId: accountLocalId,
        hiveListsOrderingIndex: listsOrderingIndex!,
        hiveAccountListPropertiesLocalIds: [],
      );
      propertiesLocalId = nanoid();
      accountPropertiesBox.put(propertiesLocalId, properties);
    }

    final hiveStoreAccount = HiveStoreAccount(
      hiveServerId: serverId,
      hiveServer: server,
      hiveName: name,
      hiveAccountPropertiesLocalId:
          propertiesLocalId ?? ValuesTheme.unknownLocalId,
    );
    accountsBox.put(accountLocalId, hiveStoreAccount);

    return HiveAccount(
      hiveDatabase: this,
      hiveStoreAccount: hiveStoreAccount,
    );
  }

  @override
  Liste createListe({
    required Account owner,
    required String listServerId,
    required String title,
    required int typeIndex,
    required DateTime creationTime,
    required DateTime editionTime,
  }) {
    final hiveStoreList = HiveStoreList(
      hiveServerId: listServerId,
      hiveOwnerAccountLocalId: owner.localId,
      hiveTitle: title,
      hiveTypeIndex: typeIndex,
      hiveCreationTime: creationTime.millisecondsSinceEpoch,
      hiveEditionTime: editionTime.millisecondsSinceEpoch,
      hiveItemLocalIds: [],
    );
    listsBox.put(nanoid(), hiveStoreList);

    final list = HiveList(
      hiveDatabase: this,
      hiveStoreList: hiveStoreList,
    );

    return list;
  }

  @override
  AccountListProperties createAccountListProperties({
    required Account user,
    required String serverId,
    required String listLocalId,
    required int itemsOrderingIndex,
    required String lexoRank,
    required bool shouldReverseOrder,
    required bool shouldStackDone,
  }) {
    final hiveStoreAccountListProperties = HiveStoreAccountListProperties(
      hiveServerId: serverId,
      hiveAccountLocalId: user.localId,
      hiveListLocalId: listLocalId,
      hiveItemsOrderingIndex: itemsOrderingIndex,
      hiveLexoRank: lexoRank,
      hiveShouldReverseOrder: shouldReverseOrder,
      hiveShouldStackDone: shouldStackDone,
    );
    accountListPropertiesBox.put(nanoid(), hiveStoreAccountListProperties);

    final hiveUserProperties = user.properties! as HiveAccountProperties;
    final hiveStoreUserProperties =
        hiveUserProperties.hiveStoreAccountProperties;
    hiveStoreUserProperties.hiveAccountListPropertiesLocalIds
        .add(hiveStoreAccountListProperties.key);
    hiveStoreUserProperties.save();

    return HiveAccountListProperties(
      hiveDatabase: this,
      hiveStoreAccountListProperties: hiveStoreAccountListProperties,
    );
  }

  @override
  Item createItem({
    required String serverId,
    required Account account,
    required Collection parent,
    required String text,
    required String position,
    required bool isDone,
    required DateTime creationTime,
    required DateTime editionTime,
    required bool isOutOfSync,
  }) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  List<Account> getAccounts() {
    return accountsBox.values
        .map((hsa) => HiveAccount(
              hiveDatabase: this,
              hiveStoreAccount: hsa,
            ))
        .toList();
  }
}
