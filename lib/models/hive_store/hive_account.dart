import 'package:hive/hive.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/models/account_properties.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/hive_store/hive_database.dart';
import 'package:open_items/models/hive_store/properties/hive_account_properties.dart';

part 'hive_account.g.dart';

@HiveType(typeId: 1)
class HiveStoreAccount with HiveObjectMixin {
  @HiveField(0)
  String hiveServerId;

  @HiveField(1)
  final String hiveServer;

  @HiveField(2)
  String hiveName;

  @HiveField(3)
  final String hivePropertiesLocalId;

  HiveStoreAccount({
    required this.hiveServerId,
    required this.hiveServer,
    required this.hiveName,
    required this.hivePropertiesLocalId,
  });
}

class HiveAccount extends Account {
  final HiveStoreAccount hiveStoreAccount;
  final HiveDatabase hiveDatabase;

  HiveAccount({
    required this.hiveDatabase,
    required this.hiveStoreAccount,
  });

  @override
  Database get database => hiveDatabase;

  @override
  String get localId => hiveStoreAccount.key;

  @override
  String get serverId => hiveStoreAccount.hiveServerId;

  @override
  String get server => hiveStoreAccount.hiveServer;

  @override
  String get name => hiveStoreAccount.hiveName;

  @override
  set name(String newName) {
    hiveStoreAccount.hiveName = newName;
    hiveStoreAccount.save();
  }

  @override
  // TODO: implement properties
  AccountProperties? get properties {
    final propertiesLocalId = hiveStoreAccount.hivePropertiesLocalId;
    if (propertiesLocalId == ValuesTheme.unknownLocalId) return null;

    return hiveDatabase.accountPropertiesBox.get(propertiesLocalId);
  }

  @override
  void delete() {
    for (final list in properties!.lists) {
      list.delete();
    }
    properties!.delete();
    hiveStoreAccount.delete();
  }
}
