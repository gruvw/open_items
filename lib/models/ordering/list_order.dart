import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/models/properties/account_properties.dart';
import 'package:open_items/state/application/globals.dart';

int Function(AccountListProperties?, AccountListProperties?) listsOrdering(
    AccountProperties properties) {
  int listPositionCompare(
      AccountListProperties? lp1, AccountListProperties? lp2) {
    if (lp1 == null || lp2 == null) return 0;

    late final l1 = database.getListe(lp1.listLocalId)!;
    late final l2 = database.getListe(lp2.listLocalId)!;

    final reversed = properties.shouldReverseOrder ? -1 : 1;
    final value = switch (properties.listsOrdering) {
      ListsOrdering.alphabetical => l1.title.compareTo(l2.title),
      ListsOrdering.creation => l1.creationTime.compareTo(l2.creationTime),
      ListsOrdering.edition => l1.editionTime.compareTo(l2.editionTime),
      ListsOrdering.custom => lp1.lexoRank.compareTo(lp2.lexoRank)
    };

    return reversed * value;
  }

  return listPositionCompare;
}
