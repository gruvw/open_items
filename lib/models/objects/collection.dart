import 'package:flutter/material.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/item.dart';

enum CollectionType {
  check("ToDo", UIIcons.checklist),
  unordered("Unordered", UIIcons.bulletList),
  ordered("Ordered", UIIcons.numberedList);

  static bool isValidIndex(int typeIndex) =>
      typeIndex >= 0 && typeIndex < CollectionType.values.length;

  final String label;
  final IconData icon;

  const CollectionType(this.label, this.icon);

  factory CollectionType.ofIndex(int typeIndex) =>
      CollectionType.values.elementAt(typeIndex);
}

abstract class Collection extends DatabaseServerObject {
  static const String displayPathSeparator = " > ";

  @protected
  int get typeIndex;

  DateTime get creationTime;
  DateTime get editionTime;
  String get content;
  String get listId;

  List<Item> get items;
  List<Collection> get collectionPath;

  bool isChildOf(Collection collection, {bool direct = false});

  // Helper methods

  String get displayPath => collectionPath
      .map((collection) => collection.content)
      .join(displayPathSeparator);

  List<Collection> get deepFlattened =>
      [this, for (final item in items) ...item.deepFlattened];

  CollectionType get collectionType => CollectionType.ofIndex(typeIndex);
}
