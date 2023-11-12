import 'package:flutter/foundation.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/ordering/orderings.dart';

abstract class AccountListProperties extends DatabaseServerObject {
  String get lexoRank;
  bool get shouldReverseOrder;
  bool get shouldStackDone;

  @protected
  int get itemsOrderingIndex;

  AccountListProperties copyWith({
    String? lexoRank,
    bool? shouldReverseOrder,
    bool? shouldStackDone,
    ItemsOrdering? itemsOrdering,
  });

  String get userId;
  String get listId;

  // Helper methods

  ItemsOrdering get itemsOrdering => ItemsOrdering.ofIndex(itemsOrderingIndex);
}
