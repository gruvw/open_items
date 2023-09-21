import 'package:flutter/material.dart';

import 'package:open_items/models/account.dart';
import 'package:open_items/models/collection.dart';
import 'package:open_items/global/data_fields.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/ordering/item_order.dart';

enum ListType {
  check("ToDo", Icons.checklist),
  unordered("Unordered", Icons.format_list_bulleted),
  ordered("Ordered", Icons.format_list_numbered);

  static bool isValidIndex(int typeIndex) =>
      typeIndex >= 0 && typeIndex < ListType.values.length;

  final String label;
  final IconData icon;

  const ListType(this.label, this.icon);

  factory ListType.ofIndex(int typeIndex) =>
      ListType.values.elementAt(typeIndex);
}

abstract class Liste implements Collection {
  Account get owner;

  abstract String title;

  @protected
  abstract int typeIndex;

  ListType get listType => ListType.ofIndex(typeIndex);
  set listType(ListType newType) => typeIndex = newType.index;

  @override
  DatabaseObjectType get dbType => DatabaseObjectType.list;

  @override
  Liste get list => this;

  @override
  String get content => title;

  @override
  List<Collection> get collectionPath => [this];

  @override
  bool isChildOf(Collection collection, {bool direct = false}) => false;

  Map<String, dynamic> toJsonFor(Account account) {
    final properties = account.listProperties(this);
    final orderedItems = items..sort(itemsOrdering(account));

    return {
      ListFields.title: title,
      ListFields.typeIndex: typeIndex,
      ListFields.orderIndex: properties.itemsOrderingIndex,
      ListFields.shouldReverseOrder: properties.shouldReverseOrder,
      ListFields.shouldStackDone: properties.shouldStackDone,
      ListFields.positon: properties.lexoRank,
      CollectionFields.creationTime: creationTime,
      CollectionFields.editionTime: editionTime,
      ListFields.items: [
        for (final item in orderedItems) item.toJsonFor(account)
      ]
    };
  }
}
