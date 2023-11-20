import 'package:flutter/material.dart';
import 'package:open_items/global/data_fields.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/ordering/item_order.dart';
import 'package:open_items/models/properties/account_list_properties.dart';

abstract class Item extends Collection {
  String get text;
  String get lexoRank;
  bool get isDone;
  DateTime get doneTime;

  Item copyWith({
    String? text,
    CollectionType? type,
    String? lexoRank,
    bool? isDone,
  });

  String get parentId;

  @protected
  Collection get parent;

  @override
  String get listId => parent.listId;

  // Helper methods

  bool get isFirstLevel => parent.localId == listId;

  @override
  String get content => text;

  @override
  List<Collection> get collectionPath => [...parent.collectionPath, this];

  @override
  bool isChildOf(Collection collection, {bool direct = false}) {
    if (parent.localId == collection.localId) return true;
    if (direct) return false;
    return parent.isChildOf(collection);
  }

  Map<String, dynamic> toJsonWith(AccountListProperties listProperties) {
    final orderedItems = items..sort(itemsOrdering(listProperties));

    return {
      ItemFields.text: text,
      ItemFields.isDone: isDone,
      ItemFields.position: lexoRank,
      CollectionFields.creationTime: creationTime,
      CollectionFields.editionTime: editionTime,
      ItemFields.doneTime: doneTime,
      ItemFields.subitems: [
        for (final item in orderedItems) item.toJsonWith(listProperties)
      ]
    };
  }
}
