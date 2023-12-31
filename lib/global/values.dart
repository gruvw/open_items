import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/ordering/orderings.dart';

abstract class CoreValues {
  static const onlineServerDefault = "open-items.org";
  static const offlineServer = "offline";

  static const unknownLocalId = "unknown_local_id";
  static const unknownServerId = "unknown_server_id";
  static const offlineServerId = "offline_server_id";
}

abstract class UIValues {
  static const applicationTitle = "Open-Items";
  static const errorRouteText = "ERROR";

  static const confirmTextDefault = "Confirm";
  static const cancelTextDefault = "Cancel";
}

abstract class DefaultValues {
  static const collectionType = CollectionType.check;
  static const listsOrdering = ListsOrdering.custom;
  static const itemsOrdering = ItemsOrdering.custom;
  static const shouldReverse = false;
  static const shouldStackDone = true;
  static const isDone = false;
  static const offlineAccountName = "offline_account";
}

abstract class UIPlaceholders {
  static const email = "email@example.com";
  static const accountName = "my_account";
  static const password = "•••••••••••";
  static const listTitle = "My List";
  static const itemText = "My item";
}
