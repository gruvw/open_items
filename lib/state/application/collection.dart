import 'package:collection/collection.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/objects/list.dart';
import 'package:open_items/models/ordering/item_order.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/state/application/database.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'collection.g.dart';

@riverpod
AccountListProperties? accountListProperties(
  AccountListPropertiesRef ref, {
  required String? propertiesId,
}) {
  ref.watch(objectEventsProvider(localId: propertiesId));
  return database.getAccountListProperties(propertiesId);
}

@riverpod
Collection? collection(
  CollectionRef ref, {
  required String? collectionId,
}) {
  ref.watch(objectEventsProvider(localId: collectionId));
  return database.getCollection(collectionId);
}

@riverpod
Liste? list(
  ListRef ref, {
  required String? listId,
}) {
  ref.watch(objectEventsProvider(localId: listId));
  return database.getListe(listId);
}

@riverpod
Item? item(
  ItemRef ref, {
  required String? itemId,
}) {
  ref.watch(objectEventsProvider(localId: itemId));
  return database.getItem(itemId);
}

@riverpod
List<Item>? items(
  ItemsRef ref, {
  required String? listPropertiesId,
  required String? parentId,
}) {
  final listProperties =
      ref.watch(accountListPropertiesProvider(propertiesId: listPropertiesId));
  final collection = ref.watch(collectionProvider(collectionId: parentId));
  if (listProperties == null || collection == null) return null;

  final ordering = itemsOrdering(listProperties);

  return collection.itemIds
      .map((iid) => ref.watch(itemProvider(itemId: iid)))
      .whereNotNull()
      .sorted(ordering)
      .toList();
}
