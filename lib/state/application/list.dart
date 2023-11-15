import 'package:open_items/models/objects/list.dart';
import 'package:open_items/models/properties/account_list_properties.dart';
import 'package:open_items/state/application/database.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list.g.dart';

@riverpod
AccountListProperties? accountListProperties(
  AccountListPropertiesRef ref, {
  required String? propertiesId,
}) {
  ref.watch(objectEventsProvider(localId: propertiesId));
  return database.getAccountListProperties(propertiesId);
}

@riverpod
Liste? list(
  ListRef ref, {
  required String? localId,
}) {
  ref.watch(objectEventsProvider(localId: localId));
  return database.getListe(localId);
}
