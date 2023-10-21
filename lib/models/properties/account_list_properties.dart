import 'package:flutter/foundation.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/objects/list.dart';

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

  @protected
  abstract int itemsOrderingIndex;

  Account get user;
  Liste get list;

  // Helper methods

  ItemsOrdering get itemsOrdering => ItemsOrdering.ofIndex(itemsOrderingIndex);
  set itemsOrdering(ItemsOrdering newOrder) => itemsOrderingIndex = newOrder.index;
}
