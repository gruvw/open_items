import 'package:open_items/models/account.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/list.dart';

enum ItemsOrdering {
  custom("Custom"),
  alphabetical("Alphabetical"),
  creation("Creation Time"),
  edition("Edition Time"),
  done("Done Time");

  static bool isValidIndex(int orderIndex) =>
      orderIndex >= 0 && orderIndex < ItemsOrdering.values.length;

  final String label;

  const ItemsOrdering(this.label);

  factory ItemsOrdering.ofIndex(int orderIndex) => ItemsOrdering.values.elementAt(orderIndex);
}

// Account list properties

abstract class AccountListProperties extends DatabaseServerObject {
  abstract String lexoRank;
  abstract bool shouldReverseOrder;
  abstract bool shouldStackDone;

  abstract int itemsOrderingIndex;

  Account get user;
  Liste get list;

  @override
  DatabaseObjectType get dbType => DatabaseObjectType.accountListProperties;

  // Helper methods

  ItemsOrdering get itemsOrdering => ItemsOrdering.ofIndex(itemsOrderingIndex);
  set itemsOrdering(ItemsOrdering newOrder) => itemsOrderingIndex = newOrder.index;
}
