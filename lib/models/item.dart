import 'package:open_items/models/account.dart';
import 'package:open_items/models/collection.dart';
import 'package:open_items/global/data_fields.dart';
import 'package:open_items/models/ordering/item_order.dart';

abstract class Item implements Collection {
  abstract String text;
  abstract bool isDone;
  abstract int doneTime;

  Collection get parent;

  @override
  String get content => text;

  @override
  List<Collection> get collectionPath => [...parent.collectionPath, this];

  @override
  bool isChildOf(Collection collection, {bool direct = false}) {
    if (parent.id == collection.id) return true;
    if (direct) return false;
    return parent.isChildOf(collection);
  }

  Map<String, dynamic> toJsonFor(Account account) {
    final properties = account.itemProperties(this);
    final orderedItems = items..sort(itemsOrdering(account));

    return {
      ItemFields.text: text,
      ItemFields.isDone: isDone,
      ItemFields.position: properties.lexoRank,
      CollectionFields.creationTime: creationTime,
      CollectionFields.editionTime: editionTime,
      ItemFields.doneTime: doneTime,
      ItemFields.subitems: [
        for (final item in orderedItems) item.toJsonFor(account)
      ]
    };
  }
}
