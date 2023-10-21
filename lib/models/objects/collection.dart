import 'package:flutter/material.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/objects/list.dart';

enum CollectionType {
  check("ToDo", Icons.checklist),
  unordered("Unordered", Icons.format_list_bulleted),
  ordered("Ordered", Icons.format_list_numbered);

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

  abstract DateTime editionTime;

  @protected
  abstract int typeIndex;

  DateTime get creationTime;
  String get content;
  Liste get list;

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
  set listType(CollectionType newType) => typeIndex = newType.index;

}
