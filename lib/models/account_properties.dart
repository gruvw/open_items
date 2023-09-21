import 'package:open_items/models/database.dart';

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

// Account object properties

abstract class AccountCollectionProperties implements DatabaseObject {
  abstract String lexoRank;
}

abstract class AccountListProperties implements AccountCollectionProperties {
  abstract bool shouldReverseOrder;
  abstract bool shouldStackDone;

  abstract int itemsOrderingIndex;

  // Helper methods

  ItemsOrdering get itemsOrdering => ItemsOrdering.ofIndex(itemsOrderingIndex);
  set itemsOrdering(ItemsOrdering newOrder) => itemsOrderingIndex = newOrder.index;
}

abstract class AccountItemProperties implements AccountCollectionProperties {

}
