import 'package:hive/hive.dart' hide HiveList;
import 'package:open_items/models/account.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_account.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/hive_store/properties/hive_account_list_properties.dart';
import 'package:open_items/models/properties/account_properties.dart';

@HiveType(typeId: 4)
class HiveStoreAccountProperties with HiveObjectMixin {
  @HiveField(0)
  String hiveAccountLocalId;

  @HiveField(1)
  int hiveListsOrderingIndex;

  @HiveField(2)
  List<String> hiveAccountListPropertiesLocalIds;

  HiveStoreAccountProperties({
    required this.hiveAccountLocalId,
    required this.hiveListsOrderingIndex,
    required this.hiveAccountListPropertiesLocalIds,
  });
}

class HiveAccountProperties extends AccountProperties {
  final HiveStoreAccountProperties hiveStoreAccountProperties;
  final HiveDatabase hiveDatabase;

  HiveAccountProperties({
    required this.hiveDatabase,
    required this.hiveStoreAccountProperties,
  });

  @override
  Database get database => hiveDatabase;

  @override
  String get localId => hiveStoreAccountProperties.key;

  @override
  int get listsOrderingIndex =>
      hiveStoreAccountProperties.hiveListsOrderingIndex;

  @override
  set listsOrderingIndex(int newListsOrderingIndex) {
    hiveStoreAccountProperties.hiveListsOrderingIndex = newListsOrderingIndex;
    hiveStoreAccountProperties.save();
  }

  @override
  Account get account {
    final hiveStoreAccount = hiveDatabase.accountsBox
        .get(hiveStoreAccountProperties.hiveAccountLocalId)!;

    return HiveAccount(
      hiveDatabase: hiveDatabase,
      hiveStoreAccount: hiveStoreAccount,
    );
  }

  @override
  List<HiveAccountListProperties> get listsProperties {
    return hiveStoreAccountProperties.hiveAccountListPropertiesLocalIds.map((alpId) => HiveAccountListProperties(
          hiveDatabase: hiveDatabase,
          hiveStoreAccountListProperties: hiveDatabase.accountListPropertiesBox.get(alpId)!,
        )).toList();
  }

  @override
  void delete() {
    for (final listProperties in listsProperties) {
      final list = listProperties.list;
      if (account.isOwnerOf(list)) {
        list.delete();
      } else {
        listProperties.delete();
      }
    }

    hiveStoreAccountProperties.delete();
  }
}
