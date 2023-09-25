import 'package:open_items/models/account.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/models/properties/account_properties.dart';

int Function(AccountListProperties, AccountListProperties) listsOrdering(Account account) {
  final order = account.properties!.listsOrdering;

  int listPositionCompare(AccountListProperties lp1, AccountListProperties lp2) {
    final l1 = lp1.list;
    final l2 = lp2.list;

    switch (order) {
      case ListsOrdering.alphabetical:
        return l1.title.compareTo(l2.title);
      case ListsOrdering.creation:
        return l1.creationTime.compareTo(l2.creationTime);
      case ListsOrdering.edition:
        return l1.editionTime.compareTo(l2.editionTime);
      case ListsOrdering.custom:
        return lp1.lexoRank.compareTo(lp2.lexoRank);
    }
  }

  return listPositionCompare;
}
