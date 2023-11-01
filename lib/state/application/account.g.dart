// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localAccountEventsHash() =>
    r'4e2ed5dd898bc8fba68e9cf1ef6e76866d294895';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [_localAccountEvents].
@ProviderFor(_localAccountEvents)
const _localAccountEventsProvider = _LocalAccountEventsFamily();

/// See also [_localAccountEvents].
class _LocalAccountEventsFamily
    extends Family<AsyncValue<Event<DatabaseObject>>> {
  /// See also [_localAccountEvents].
  const _LocalAccountEventsFamily();

  /// See also [_localAccountEvents].
  _LocalAccountEventsProvider call({
    required String accountId,
  }) {
    return _LocalAccountEventsProvider(
      accountId: accountId,
    );
  }

  @override
  _LocalAccountEventsProvider getProviderOverride(
    covariant _LocalAccountEventsProvider provider,
  ) {
    return call(
      accountId: provider.accountId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'_localAccountEventsProvider';
}

/// See also [_localAccountEvents].
class _LocalAccountEventsProvider
    extends AutoDisposeStreamProvider<Event<DatabaseObject>> {
  /// See also [_localAccountEvents].
  _LocalAccountEventsProvider({
    required String accountId,
  }) : this._internal(
          (ref) => _localAccountEvents(
            ref as _LocalAccountEventsRef,
            accountId: accountId,
          ),
          from: _localAccountEventsProvider,
          name: r'_localAccountEventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localAccountEventsHash,
          dependencies: _LocalAccountEventsFamily._dependencies,
          allTransitiveDependencies:
              _LocalAccountEventsFamily._allTransitiveDependencies,
          accountId: accountId,
        );

  _LocalAccountEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountId,
  }) : super.internal();

  final String accountId;

  @override
  Override overrideWith(
    Stream<Event<DatabaseObject>> Function(_LocalAccountEventsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _LocalAccountEventsProvider._internal(
        (ref) => create(ref as _LocalAccountEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        accountId: accountId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Event<DatabaseObject>> createElement() {
    return _LocalAccountEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _LocalAccountEventsProvider && other.accountId == accountId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _LocalAccountEventsRef
    on AutoDisposeStreamProviderRef<Event<DatabaseObject>> {
  /// The parameter `accountId` of this provider.
  String get accountId;
}

class _LocalAccountEventsProviderElement
    extends AutoDisposeStreamProviderElement<Event<DatabaseObject>>
    with _LocalAccountEventsRef {
  _LocalAccountEventsProviderElement(super.provider);

  @override
  String get accountId => (origin as _LocalAccountEventsProvider).accountId;
}

String _$localAccountHash() => r'dc13d1c498964792e81179ff0814b5abcfd9cd2a';

/// See also [localAccount].
@ProviderFor(localAccount)
const localAccountProvider = LocalAccountFamily();

/// See also [localAccount].
class LocalAccountFamily extends Family<Account?> {
  /// See also [localAccount].
  const LocalAccountFamily();

  /// See also [localAccount].
  LocalAccountProvider call({
    required String accountId,
  }) {
    return LocalAccountProvider(
      accountId: accountId,
    );
  }

  @override
  LocalAccountProvider getProviderOverride(
    covariant LocalAccountProvider provider,
  ) {
    return call(
      accountId: provider.accountId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'localAccountProvider';
}

/// See also [localAccount].
class LocalAccountProvider extends AutoDisposeProvider<Account?> {
  /// See also [localAccount].
  LocalAccountProvider({
    required String accountId,
  }) : this._internal(
          (ref) => localAccount(
            ref as LocalAccountRef,
            accountId: accountId,
          ),
          from: localAccountProvider,
          name: r'localAccountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localAccountHash,
          dependencies: LocalAccountFamily._dependencies,
          allTransitiveDependencies:
              LocalAccountFamily._allTransitiveDependencies,
          accountId: accountId,
        );

  LocalAccountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountId,
  }) : super.internal();

  final String accountId;

  @override
  Override overrideWith(
    Account? Function(LocalAccountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocalAccountProvider._internal(
        (ref) => create(ref as LocalAccountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        accountId: accountId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Account?> createElement() {
    return _LocalAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalAccountProvider && other.accountId == accountId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocalAccountRef on AutoDisposeProviderRef<Account?> {
  /// The parameter `accountId` of this provider.
  String get accountId;
}

class _LocalAccountProviderElement extends AutoDisposeProviderElement<Account?>
    with LocalAccountRef {
  _LocalAccountProviderElement(super.provider);

  @override
  String get accountId => (origin as LocalAccountProvider).accountId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
