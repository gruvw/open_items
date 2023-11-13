import 'package:open_items/models/ordering/orderings.dart';

abstract class CoreValues {
  static const onlineServerDefault = "open-items.org";
  static const offlineServer = "offline";

  static const unknownLocalId = "unknown_local_id";
  static const unknownServerId = "unknown_server_id";
  static const offlineServerId = "offline_server_id";

  static const defaultListsOrdering = ListsOrdering.custom;
  static const defaultShouldReverse = false;
}

abstract class UIValues {
  static const applicationTitle = "Open-Items";
  static const errorRouteText = "ERROR";

  static const offlineAccountNameDefault = "offline_account";
  static const confirmTextDefault = "Confirm";
  static const cancelTextDefault = "Cancel";

  static const emailPlaceholder = "email@example.com";
  static const accountNamePlaceholder = "my_account";
  static const passwordPlaceholder = "•••••••••••";
}
