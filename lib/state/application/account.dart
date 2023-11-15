import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/properties/account_properties.dart';
import 'package:open_items/state/application/database.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account.g.dart';

@riverpod
Account? localAccount(
  LocalAccountRef ref, {
  required String? accountId,
}) {
  ref.watch(objectEventsProvider(localId: accountId));
  return database.getLocalAccount(accountId);
}

@riverpod
AccountProperties? accountProperties(
  AccountPropertiesRef ref, {
  required String? propertiesId,
}) {
  ref.watch(objectEventsProvider(localId: propertiesId));
  return database.getAccountProperties(propertiesId);
}
