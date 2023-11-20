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
  required String? localId,
}) {
  ref.watch(objectEventsProvider(localId: localId));
  return database.getCollection(localId);
}

@riverpod
Liste? list(
  ListRef ref, {
  required String? localId,
}) {
  ref.watch(objectEventsProvider(localId: localId));
  return database.getListe(localId);
}

@riverpod
Item? item(
  ItemRef ref, {
  required String? localId,
}) {
  ref.watch(objectEventsProvider(localId: localId));
  return database.getItem(localId);
}

@riverpod
List<Item>? items(
  ItemsRef ref, {
  required String? listPropertiesId,
  required String? parentId,
}) {
  final listProperties =
      ref.watch(accountListPropertiesProvider(propertiesId: listPropertiesId));
  final collection = ref.watch(collectionProvider(localId: parentId));
  if (listProperties == null || collection == null) return null;

  final ordering = itemsOrdering(listProperties);

  return collection.itemIds
      .map((iid) => ref.watch(itemProvider(localId: iid)))
      .whereNotNull()
      .sorted(ordering)
      .toList();
}
