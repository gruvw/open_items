import 'package:open_items/models/properties/account_properties.dart';

abstract class CoreValues {
  static const String onlineServerDefault = "open-items.org";
  static const String offlineServer = "offline";

  static const String unknownLocalId = "unknown_local_id";
  static const String unknownServerId = "unknown_server_id";
  static const String offlineServerId = "offline_server_id";

  static const ListsOrdering defaultListsOrdering = ListsOrdering.custom;
}

abstract class UIValues {
  static const String applicationTitle = "Open-Items";
  static const String errorRouteText = "ERROR";

  static const String offlineAccountNameDefault = "offline_account";
  static const String confirmButtonTextDefault = "Confirm";

  static const String emailPlaceholder = "email@example.com";
  static const String usernamePlaceholder = "my_username";
  static const String offlineNamePlaceholder = "My Account";
  static const String passwordPlaceholder = "•••••••••••";
}
