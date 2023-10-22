import 'package:hive/hive.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/properties/account_properties.dart';
import 'package:open_items/models/stores/hive/hive_database.dart';
import 'package:open_items/models/stores/hive/properties/hive_account_properties.dart';

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
  final String hiveAccountPropertiesLocalId;

  HiveStoreAccount({
    required this.hiveServerId,
    required this.hiveServer,
    required this.hiveName,
    required this.hiveAccountPropertiesLocalId,
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
  AccountProperties? get properties {
    final propertiesLocalId = hiveStoreAccount.hiveAccountPropertiesLocalId;
    if (propertiesLocalId == CoreValues.unknownLocalId) return null;

    return HiveAccountProperties(
      hiveDatabase: hiveDatabase,
      hiveStoreAccountProperties: hiveDatabase.accountPropertiesBox.get(propertiesLocalId)!,
    );
  }

  @override
  void delete() {
    if (isLocal) {
      properties!.delete();
    }

    hiveStoreAccount.delete();
  }
}