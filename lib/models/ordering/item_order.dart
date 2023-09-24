import 'package:open_items/models/account.dart';
import 'package:open_items/models/item.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/properties/account_collection_properties.dart';

int Function(Item, Item) itemsOrdering(Account account) {
  final properties = account.properties!;
  int itemsPositionCompare(Item i1, Item i2) {
    final list = i1.list; // supposes the two items have the same list
    final listProperties = properties.listProperties(list);
    final i1Properties = properties.itemProperties(i1);
    final i2Properties = properties.itemProperties(i2);

    final order = listProperties.itemsOrdering;
    final stackDone = listProperties.shouldStackDone;
    final reversed = listProperties.shouldReverseOrder ? -1 : 1;

    // Stack done items
    if (list.listType == ListType.check && stackDone && i1.isDone != i2.isDone) {
      return reversed * (i1.isDone ? 1 : -1);
    }

    int res = 0;
    switch (order) {
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
        res = i1Properties.lexoRank.compareTo(i2Properties.lexoRank);
        break;
    }

    return reversed * res;
  }

  return itemsPositionCompare;
}
