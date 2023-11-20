import 'package:collection/collection.dart';
import 'package:open_items/models/objects/list.dart';
import 'package:open_items/models/ordering/list_order.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/state/application/account.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lists.g.dart';

@riverpod
List<AccountListProperties>? listsProperties(
  ListsPropertiesRef ref, {
  required String? accountId,
}) {
  final accountProperties =
      ref.watch(accountPropertiesProvider(accountId: accountId));

  if (accountProperties == null) return null;

  return accountProperties.listsPropertiesIds
      .map((lpid) => ref.watch(
            accountListPropertiesProvider(propertiesId: lpid),
          ))
      .whereNotNull()
      .toList();
}

@riverpod
List<Liste>? lists(
  ListsRef ref, {
  required String? accountId,
}) {
  final accountProperties =
      ref.watch(accountPropertiesProvider(accountId: accountId));
  final listsProperties =
      ref.watch(listsPropertiesProvider(accountId: accountId));
  if (accountProperties == null || listsProperties == null) return null;
  final ordering = listsOrdering(accountProperties);

  return listsProperties
      .sorted(ordering)
      .map((lp) => lp.listId)
      .map((lid) => ref.watch(listProvider(localId: lid)))
      .whereNotNull()
      .toList();
}
