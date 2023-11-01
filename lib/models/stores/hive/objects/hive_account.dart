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
  final HiveDatabase hiveDatabase;
  final HiveStoreAccount hiveStoreAccount;

  @override
  final String localId;
  @override
  final String serverId;
  @override
  final String server;
  @override
  final String name;
  // final AccountProperties properties; // TODO

  HiveAccount({
    required this.hiveDatabase,
    required this.hiveStoreAccount,
    String? name,
  })  : localId = hiveStoreAccount.key,
        serverId = hiveStoreAccount.hiveServerId,
        server = hiveStoreAccount.hiveServer,
        name = name ?? hiveStoreAccount.hiveName;

  @override
  Database get database => hiveDatabase;

  @override
  Account copyWith({
    String? name,
  }) {
    return HiveAccount(
      hiveDatabase: hiveDatabase,
      hiveStoreAccount: hiveStoreAccount,
      name: name,
    );
  }

  @override
  AccountProperties? get properties {
    final propertiesLocalId = hiveStoreAccount.hiveAccountPropertiesLocalId;
    if (propertiesLocalId == CoreValues.unknownLocalId) return null;

    return HiveAccountProperties(
      hiveDatabase: hiveDatabase,
      hiveStoreAccountProperties:
          hiveDatabase.accountPropertiesBox.get(propertiesLocalId)!,
    );
  }

  @override
  Future<void> save() {
    hiveStoreAccount.hiveName = name;
    return hiveStoreAccount.save().then((_) => notify(EventType.edit));
  }

  @override
  Future<void> delete() async {
    if (isLocal) {
      await properties!.delete();
    }

    await hiveStoreAccount.delete().then((_) => notify(EventType.delete));
  }
}
