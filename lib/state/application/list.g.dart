// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountListPropertiesHash() =>
    r'6ebf4dcddadb564e53c5d5fb6949913519d00668';

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

/// See also [accountListProperties].
@ProviderFor(accountListProperties)
const accountListPropertiesProvider = AccountListPropertiesFamily();

/// See also [accountListProperties].
class AccountListPropertiesFamily extends Family<AccountListProperties?> {
  /// See also [accountListProperties].
  const AccountListPropertiesFamily();

  /// See also [accountListProperties].
  AccountListPropertiesProvider call({
    required String? propertiesId,
  }) {
    return AccountListPropertiesProvider(
      propertiesId: propertiesId,
    );
  }

  @override
  AccountListPropertiesProvider getProviderOverride(
    covariant AccountListPropertiesProvider provider,
  ) {
    return call(
      propertiesId: provider.propertiesId,
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
  String? get name => r'accountListPropertiesProvider';
}

/// See also [accountListProperties].
class AccountListPropertiesProvider
    extends AutoDisposeProvider<AccountListProperties?> {
  /// See also [accountListProperties].
  AccountListPropertiesProvider({
    required String? propertiesId,
  }) : this._internal(
          (ref) => accountListProperties(
            ref as AccountListPropertiesRef,
            propertiesId: propertiesId,
          ),
          from: accountListPropertiesProvider,
          name: r'accountListPropertiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accountListPropertiesHash,
          dependencies: AccountListPropertiesFamily._dependencies,
          allTransitiveDependencies:
              AccountListPropertiesFamily._allTransitiveDependencies,
          propertiesId: propertiesId,
        );

  AccountListPropertiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.propertiesId,
  }) : super.internal();

  final String? propertiesId;

  @override
  Override overrideWith(
    AccountListProperties? Function(AccountListPropertiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccountListPropertiesProvider._internal(
        (ref) => create(ref as AccountListPropertiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        propertiesId: propertiesId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AccountListProperties?> createElement() {
    return _AccountListPropertiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountListPropertiesProvider &&
        other.propertiesId == propertiesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, propertiesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccountListPropertiesRef
    on AutoDisposeProviderRef<AccountListProperties?> {
  /// The parameter `propertiesId` of this provider.
  String? get propertiesId;
}

class _AccountListPropertiesProviderElement
    extends AutoDisposeProviderElement<AccountListProperties?>
    with AccountListPropertiesRef {
  _AccountListPropertiesProviderElement(super.provider);

  @override
  String? get propertiesId =>
      (origin as AccountListPropertiesProvider).propertiesId;
}

String _$listHash() => r'287a3db48f17e3c518c732ef38ec4d82167da71f';

/// See also [list].
@ProviderFor(list)
const listProvider = ListFamily();

/// See also [list].
class ListFamily extends Family<Liste?> {
  /// See also [list].
  const ListFamily();

  /// See also [list].
  ListProvider call({
    required String? localId,
  }) {
    return ListProvider(
      localId: localId,
    );
  }

  @override
  ListProvider getProviderOverride(
    covariant ListProvider provider,
  ) {
    return call(
      localId: provider.localId,
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
  String? get name => r'listProvider';
}

/// See also [list].
class ListProvider extends AutoDisposeProvider<Liste?> {
  /// See also [list].
  ListProvider({
    required String? localId,
  }) : this._internal(
          (ref) => list(
            ref as ListRef,
            localId: localId,
          ),
          from: listProvider,
          name: r'listProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$listHash,
          dependencies: ListFamily._dependencies,
          allTransitiveDependencies: ListFamily._allTransitiveDependencies,
          localId: localId,
        );

  ListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.localId,
  }) : super.internal();

  final String? localId;

  @override
  Override overrideWith(
    Liste? Function(ListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListProvider._internal(
        (ref) => create(ref as ListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        localId: localId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Liste?> createElement() {
    return _ListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListProvider && other.localId == localId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, localId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListRef on AutoDisposeProviderRef<Liste?> {
  /// The parameter `localId` of this provider.
  String? get localId;
}

class _ListProviderElement extends AutoDisposeProviderElement<Liste?>
    with ListRef {
  _ListProviderElement(super.provider);

  @override
  String? get localId => (origin as ListProvider).localId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
