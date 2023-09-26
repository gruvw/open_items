import 'package:open_items/models/account.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/properties/account_list_properties.dart';

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

abstract class AccountProperties extends DatabaseObject {
  abstract int listsOrderingIndex;

  Account get account;
  List<AccountListProperties> get listsProperties;

  @override
  DatabaseObjectType get dbType => DatabaseObjectType.accountProperties;

  // Helper methods

  ListsOrdering get listsOrdering => ListsOrdering.ofIndex(listsOrderingIndex);
  set listsOrdering(ListsOrdering newOrder) =>
      listsOrderingIndex = newOrder.index;
}
