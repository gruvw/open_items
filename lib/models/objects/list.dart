import 'package:open_items/global/data_fields.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/ordering/item_order.dart';
import 'package:open_items/models/properties/account_list_properties.dart';

abstract class Liste extends Collection {
  Account get ownerAccount;

  abstract String title;

  // Helper methods

  @override
  Liste get list => this;

  @override
  String get content => title;

  @override
  List<Collection> get collectionPath => [this];

  @override
  bool isChildOf(Collection collection, {bool direct = false}) => false;

  Map<String, dynamic> toJsonWith(AccountListProperties listProperties) {
    final orderedItems = items..sort(itemsOrdering(listProperties));

    return {
      ListFields.title: title,
      ListFields.typeIndex: collectionType.index,
      ListFields.orderIndex: listProperties.itemsOrdering.index,
      ListFields.shouldReverseOrder: listProperties.shouldReverseOrder,
      ListFields.shouldStackDone: listProperties.shouldStackDone,
      ListFields.positon: listProperties.lexoRank,
      CollectionFields.creationTime: creationTime,
      CollectionFields.editionTime: editionTime,
      ListFields.items: [
        for (final item in orderedItems) item.toJsonWith(listProperties)
      ]
    };
  }
}
