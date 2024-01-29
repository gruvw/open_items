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
  required String? accountLocalId,
}) {
  final accountProperties =
      ref.watch(accountPropertiesProvider(accountLocalId: accountLocalId));

  if (accountProperties == null) {
    return null;
  }

  return accountProperties.listsPropertiesLocalIds
      .map((id) => ref.watch(
            accountListPropertiesProvider(propertiesLocalId: id),
          ))
      .whereNotNull()
      .toList();
}

@riverpod
List<Liste>? lists(
  ListsRef ref, {
  required String? accountLocalId,
}) {
  final accountProperties =
      ref.watch(accountPropertiesProvider(accountLocalId: accountLocalId));
  final listsProperties =
      ref.watch(listsPropertiesProvider(accountLocalId: accountLocalId));

  if (accountProperties == null || listsProperties == null) {
    return null;
  }

  final ordering = listsOrdering(accountProperties);

  return listsProperties
      .sorted(ordering)
      .map((lp) => lp.listLocalId)
      .map((id) => ref.watch(listProvider(listLocalId: id)))
      .whereNotNull()
      .toList();
}
