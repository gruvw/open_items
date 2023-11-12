import 'package:open_items/global/values.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/list.dart';

abstract class Account extends DatabaseServerObject {
  String get name;
  String get server;

  String? get accountPropertiesId;

  Account copyWith({
    String? name,
  });

  // Helper methods

  bool isOwnerOf(Liste list) {
    return list.ownerAccountId == localId;
  }

  String get accountId => "$name@$server";

  bool get isOffline => server == CoreValues.offlineServer;

  // Does the current client have access to this account
  bool get isLocal => accountPropertiesId != null;
}
