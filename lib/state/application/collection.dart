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
  required String? propertiesLocalId,
}) {
  ref.watch(objectEventsProvider(localId: propertiesLocalId));
  return database.getAccountListProperties(propertiesLocalId);
}

@riverpod
Collection? collection(
  CollectionRef ref, {
  required String? collectionLocalId,
}) {
  ref.watch(objectEventsProvider(localId: collectionLocalId));
  return database.getCollection(collectionLocalId);
}

@riverpod
Liste? list(
  ListRef ref, {
  required String? listLocalId,
}) {
  ref.watch(objectEventsProvider(localId: listLocalId));
  return database.getListe(listLocalId);
}

@riverpod
Item? item(
  ItemRef ref, {
  required String? itemLocalId,
}) {
  ref.watch(objectEventsProvider(localId: itemLocalId));
  return database.getItem(itemLocalId);
}

@riverpod
List<Item>? items(
  ItemsRef ref, {
  required String? listPropertiesLocalId,
  required String? parentLocalId,
}) {
  final listProperties =
      ref.watch(accountListPropertiesProvider(propertiesLocalId: listPropertiesLocalId));
  final collection = ref.watch(collectionProvider(collectionLocalId: parentLocalId));
  if (listProperties == null || collection == null) return null;

  final ordering = itemsOrdering(listProperties);

  return collection.itemLocalIds
      .map((id) => ref.watch(itemProvider(itemLocalId: id)))
      .whereNotNull()
      .sorted(ordering)
      .toList();
}

@riverpod
Collection? parent(
  ParentRef ref, {
  required String? itemLocalId,
}) {
  final item = ref.watch(itemProvider(itemLocalId: itemLocalId));
  final parent = ref.watch(collectionProvider(collectionLocalId: item?.parentLocalId));
  return parent;
}
