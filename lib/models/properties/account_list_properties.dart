import 'package:flutter/foundation.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/ordering/orderings.dart';

abstract class AccountListProperties extends DatabaseServerObject {
  String get lexoRank;
  bool get shouldReverseOrder;
  bool get shouldStackDone;

  @protected
  int get itemsOrderingIndex;

  String get userLocalId;
  String get listLocalId;

  AccountListProperties copyWith({
    String? lexoRank,
    bool? shouldReverseOrder,
    bool? shouldStackDone,
    ItemsOrdering? itemsOrdering,
  });

  // Helper methods

  // Ordering by done time also stacks done
  bool get stackDone => shouldStackDone || itemsOrdering == ItemsOrdering.done;

  ItemsOrdering get itemsOrdering => ItemsOrdering.ofIndex(itemsOrderingIndex);
}
