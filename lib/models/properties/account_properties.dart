import 'package:flutter/foundation.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/ordering/orderings.dart';

abstract class AccountProperties extends DatabaseObject {
  @protected
  int get listsOrderingIndex;
  bool get shouldReverseOrder;

  AccountProperties copyWith({
    ListsOrdering? listsOrdering,
    bool? shouldReverseOrder,
  });

  String get accountId;
  List<String> get listsPropertiesIds;

  // Helper methods

  ListsOrdering get listsOrdering => ListsOrdering.ofIndex(listsOrderingIndex);
}
