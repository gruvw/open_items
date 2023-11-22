import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/state/application/globals.dart';

int Function(Item, Item) itemsOrdering(AccountListProperties listProperties) {
  // Supposes the two items are members of the pased list
  final list = database.getListe(listProperties.listId)!;

  final doneOrder = listProperties.itemsOrdering == ItemsOrdering.done;
  final reversed = listProperties.shouldReverseOrder ? -1 : 1;

  int itemsPositionCompare(Item i1, Item i2) {
    // Stack done items
    if (list.collectionType == CollectionType.check &&
        listProperties.stackDone &&
        i1.isDone != i2.isDone) {
      // Stack done items at the top if doneOrder (xor using !=)
      return (i1.isDone != doneOrder ? 1 : -1);
    }

    final res = switch (listProperties.itemsOrdering) {
      ItemsOrdering.alphabetical =>
        i1.content.toLowerCase().compareTo(i2.content.toLowerCase()),
      ItemsOrdering.custom => i1.lexoRank.compareTo(i2.lexoRank),
      // Time based ordering are "most recent first"
      ItemsOrdering.creation => -i1.creationTime.compareTo(i2.creationTime),
      ItemsOrdering.edition => -i1.editionTime.compareTo(i2.editionTime),
      ItemsOrdering.done => -i1.doneTime.compareTo(i2.doneTime),
    };

    return reversed * res;
  }

  return itemsPositionCompare;
}
