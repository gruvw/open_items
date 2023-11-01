import 'package:hive/hive.dart' hide HiveList;
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/properties/account_properties.dart';
import 'package:open_items/models/stores/hive/hive_database.dart';
import 'package:open_items/models/stores/hive/objects/hive_account.dart';
import 'package:open_items/models/stores/hive/properties/hive_account_list_properties.dart';

part 'hive_account_properties.g.dart';

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
    return hiveStoreAccountProperties.hiveAccountListPropertiesLocalIds
        .map((alpId) => HiveAccountListProperties(
              hiveDatabase: hiveDatabase,
              hiveStoreAccountListProperties:
                  hiveDatabase.accountListPropertiesBox.get(alpId)!,
            ))
        .toList();
  }

  @override
  Future<void> delete() async {
    for (final listProperties in listsProperties) {
      final list = listProperties.list;
      if (account.isOwnerOf(list)) {
        await list.delete();
      } else {
        await listProperties.delete();
      }
    }

    await hiveStoreAccountProperties.delete();
  }

  @override
  Future<void> save() {
    // TODO: implement save
    throw UnimplementedError();
  }
}
