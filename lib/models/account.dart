import 'package:open_items/global/values.dart';
import 'package:open_items/models/account_properties.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';

enum ListsOrdering {
  custom("Custom"),
  alphabetical("Alphabetical"),
  creation("Creation Time"),
  edition("Edition Time");

  static bool isValidIndex(int orderIndex) =>
      orderIndex >= 0 && orderIndex < ItemsOrdering.values.length;

  final String label;

  const ListsOrdering(this.label);

  factory ListsOrdering.ofIndex(int orderIndex) =>
      ListsOrdering.values.elementAt(orderIndex);
}

abstract class Account implements DatabaseObject {
  abstract int listsOrderingIndex;

  String get name;
  String get server;

  bool get isOffline => server == ValuesTheme.offlineServer;

  List<Liste> get lists;

  AccountListProperties listProperties(Liste list);
  AccountItemProperties itemProperties(Item item);

  // Helper methods

  ListsOrdering get listsOrdering => ListsOrdering.ofIndex(listsOrderingIndex);
  set listsOrdering(ListsOrdering newOrder) =>
      listsOrderingIndex = newOrder.index;
}
