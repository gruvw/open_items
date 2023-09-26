import 'package:open_items/models/database.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/item.dart';

abstract class Collection extends DatabaseServerObject {
  static const String displayPathSeparator = " > ";

  abstract DateTime editionTime;

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
}
