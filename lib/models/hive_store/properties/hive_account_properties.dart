import 'package:hive/hive.dart';
import 'package:open_items/models/account_collection_properties.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/hive_store/properties/hive_account_item_properties.dart';
import 'package:open_items/models/hive_store/properties/hive_account_list_properties.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/properties/account_properties.dart';

@HiveType(typeId: 5)
class HiveStoreAccountProperties with HiveObjectMixin {
  @HiveField(0)
  int hiveListsOrderingIndex;

  @HiveField(1)
  List<String> hiveListLocalIds;

  HiveStoreAccountProperties({
    required this.hiveListsOrderingIndex,
    required this.hiveListLocalIds,
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
  // TODO: implement lists
  List<Liste> get lists => throw UnimplementedError();

  @override
  AccountListProperties listProperties(Liste list) {
    final hiveListProperties = hiveDatabase.accountListPropertiesBox.values
        .where((lp) => lp.hiveListKey == list.localId)
        .firstOrNull!;

    return HiveAccountListProperties(
      hiveDatabase: hiveDatabase,
      hiveStoreAccountListProperties: hiveListProperties,
    );
  }

  @override
  AccountItemProperties itemProperties(Item item) {
    final hiveItemProperties = hiveDatabase.accountItemPropertiesBox.values
        .where((ip) => ip.hiveItemKey == item.localId)
        .firstOrNull!;

    return HiveAccountItemProperties(
      hiveDatabase: hiveDatabase,
      hiveStoreAccountItemProperties: hiveItemProperties,
    );
  }

  @override
  void delete() {
    hiveStoreAccountProperties.delete();
  }
}
