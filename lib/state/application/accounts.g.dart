// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localAccountsEventsHash() =>
    r'1366d6ae5d37a85440dbdb4d72c50675001e6263';

/// See also [_localAccountsEvents].
@ProviderFor(_localAccountsEvents)
final _localAccountsEventsProvider =
    AutoDisposeStreamProvider<Event<DatabaseObject>>.internal(
  _localAccountsEvents,
  name: r'_localAccountsEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localAccountsEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _LocalAccountsEventsRef
    = AutoDisposeStreamProviderRef<Event<DatabaseObject>>;
String _$localAccountsHash() => r'f2d5dbf15d7ef510e8415701b810352632f2424a';

/// See also [localAccounts].
@ProviderFor(localAccounts)
final localAccountsProvider = AutoDisposeProvider<List<Account>>.internal(
  localAccounts,
  name: r'localAccountsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localAccountsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalAccountsRef = AutoDisposeProviderRef<List<Account>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
