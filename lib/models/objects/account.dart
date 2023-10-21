import 'package:open_items/global/values.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/list.dart';
import 'package:open_items/models/properties/account_properties.dart';

abstract class Account extends DatabaseServerObject {
  abstract String name;

  String get server;

  AccountProperties? get properties;

  // Helper methods

  bool isOwnerOf(Liste list) {
    final owner = list.ownerAccount;
    return owner.localId == localId;
  }

  String get accountId => "$name@$server";

  bool get isOffline => server == CoreValues.offlineServer;

  // Does the current client have access to this account
  bool get isLocal => properties != null;

}
