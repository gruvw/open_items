import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/properties/account_list_properties.dart';

int Function(Item, Item) itemsOrdering(AccountListProperties listProperties) {
  // Supposes the two items are members of the pased list
  final list = listProperties.list;
  final stackDone = listProperties.shouldStackDone;
  final reversed = listProperties.shouldReverseOrder ? -1 : 1;

  int itemsPositionCompare(Item i1, Item i2) {
    // Stack done items
    if (list.listType == ListType.check &&
        stackDone &&
        i1.isDone != i2.isDone) {
      return reversed * (i1.isDone ? 1 : -1);
    }

    int res = 0;
    switch (listProperties.itemsOrdering) {
      case ItemsOrdering.alphabetical:
        res = i1.content.toLowerCase().compareTo(i2.content.toLowerCase());
        break;
      case ItemsOrdering.creation:
        res = i1.creationTime.compareTo(i2.creationTime);
        break;
      case ItemsOrdering.edition:
        res = i1.editionTime.compareTo(i2.editionTime);
        break;
      case ItemsOrdering.done:
        res = i1.doneTime.compareTo(i2.doneTime);
        break;
      case ItemsOrdering.custom:
        res = i1.lexoRank.compareTo(i2.lexoRank);
        break;
    }

    return reversed * res;
  }

  return itemsPositionCompare;
}
