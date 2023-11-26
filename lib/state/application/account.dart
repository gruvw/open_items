import 'package:open_items/models/objects/account.dart';
import 'package:open_items/models/properties/account_properties.dart';
import 'package:open_items/state/application/database.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account.g.dart';

@riverpod
Account? localAccount(
  LocalAccountRef ref, {
  required String? accountLocalId,
}) {
  ref.watch(objectEventsProvider(localId: accountLocalId));
  return database.getLocalAccount(accountLocalId);
}

@riverpod
AccountProperties? accountProperties(
  AccountPropertiesRef ref, {
  required String? accountLocalId,
}) {
  final account = ref.watch(localAccountProvider(accountLocalId: accountLocalId));
  final propertiesLocalId = account?.accountPropertiesLocalId;

  ref.watch(objectEventsProvider(localId: propertiesLocalId));
  return database.getAccountProperties(propertiesLocalId);
}
