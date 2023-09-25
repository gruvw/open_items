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

  List<AccountListProperties> get listsProperties;

  void linkListProperties(AccountListProperties listProperties);
  void unlinkListProperties(AccountListProperties listProperties);

  @override
  DatabaseObjectType get dbType => DatabaseObjectType.account;

  // Helper methods

  bool isOwnerOf(Liste list) {
    final owner = list.ownerAccount;
    return owner.isLocal && owner.properties!.localId == localId;
  }

  ListsOrdering get listsOrdering => ListsOrdering.ofIndex(listsOrderingIndex);
  set listsOrdering(ListsOrdering newOrder) =>
      listsOrderingIndex = newOrder.index;
}
