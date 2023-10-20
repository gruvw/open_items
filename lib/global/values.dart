import 'package:open_items/models/properties/account_properties.dart';

abstract class ValuesTheme {
  static const String offlineServer = "offline";

  static const String unknownLocalId = "unknown_local_id";
  static const String unknownServerId = "unknown_server_id";
  static const String offlineServerId = "offline_server_id";

  static const ListsOrdering defaultListsOrdering = ListsOrdering.custom;
}

abstract class UIValuesTheme {
  static const String applicationTitle = "Open-Items";
  static const String errorRouteText = "ERROR";

  static const String offlineAccountNameDefault = "Offline Account";

  static const String emailPlaceholder = "email@example.com";
  static const String usernamePlaceholder = "my_username";
  static const String offlineNamePlaceholder = "My Account";
  static const String passwordPlaceholder = "********";
}
