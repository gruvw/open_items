import 'package:open_items/global/values.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/properties/account_properties.dart';

abstract class Account extends DatabaseServerObject {
  abstract String name;

  String get server;

  AccountProperties? get properties;

  @override
  DatabaseObjectType get dbType => DatabaseObjectType.account;

  // Helper methods

  String get accountId => "$name@$server";

  bool get isOffline => server == ValuesTheme.offlineServer;

  // Does the current client have access to this account
  bool get isLocal => properties != null;

}
