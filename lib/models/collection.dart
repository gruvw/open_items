import 'package:open_items/models/database.dart';
import 'package:open_items/models/list.dart';
import 'package:open_items/models/item.dart';

abstract class Collection implements DatabaseObject {
  static const String displayPathSeparator = " > ";

  abstract int editionTime;

  int get creationTime;
  String get content;
  Liste get list;

  List<Item> get items;
  List<Collection> get collectionPath;

  String get displayPath => collectionPath
      .map((collection) => collection.content)
      .join(displayPathSeparator);

  List<Collection> get deepFlattened =>
      [this, for (final item in items) ...item.deepFlattened];

  bool isChildOf(Collection collection, {bool direct = false});
}
