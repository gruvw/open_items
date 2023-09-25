import 'package:hive/hive.dart' hide HiveList;
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/hive_store/properties/hive_account_list_properties.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/models/properties/account_properties.dart';

@HiveType(typeId: 5)
class HiveStoreAccountProperties with HiveObjectMixin {
  @HiveField(0)
  int hiveListsOrderingIndex;

  @HiveField(1)
  List<String> hiveAccountListPropertiesLocalIds;

  HiveStoreAccountProperties({
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
  List<HiveAccountListProperties> get listsProperties {
    return hiveStoreAccountProperties.hiveAccountListPropertiesLocalIds.map((id) => HiveAccountListProperties(
          hiveDatabase: hiveDatabase,
          hiveStoreAccountListProperties: hiveDatabase.accountListPropertiesBox.get(id)!,
        )).toList();
  }

  @override
  void linkListProperties(AccountListProperties listProperties) {
    hiveStoreAccountProperties.hiveAccountListPropertiesLocalIds.add(listProperties.localId);
    hiveStoreAccountProperties.save();
  }

  @override
  void unlinkListProperties(AccountListProperties listProperties) {
    hiveStoreAccountProperties.hiveAccountListPropertiesLocalIds
        .removeWhere((id) => id == listProperties.localId);
    hiveStoreAccountProperties.save();
    listProperties.delete();
  }

  @override
  void delete() {
    for (final listProperties in listsProperties) {
      final list = listProperties.list;
      if (isOwnerOf(list)) {
        list.delete();
      } else {
        unlinkListProperties(listProperties);
      }
    }

    hiveStoreAccountProperties.delete();
  }
}
