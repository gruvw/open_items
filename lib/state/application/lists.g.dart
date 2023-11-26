// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listsPropertiesHash() => r'd18bea5af5ea10d32576cd37c370d15867c0ad40';

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

/// See also [listsProperties].
@ProviderFor(listsProperties)
const listsPropertiesProvider = ListsPropertiesFamily();

/// See also [listsProperties].
class ListsPropertiesFamily extends Family<List<AccountListProperties>?> {
  /// See also [listsProperties].
  const ListsPropertiesFamily();

  /// See also [listsProperties].
  ListsPropertiesProvider call({
    required String? accountLocalId,
  }) {
    return ListsPropertiesProvider(
      accountLocalId: accountLocalId,
    );
  }

  @override
  ListsPropertiesProvider getProviderOverride(
    covariant ListsPropertiesProvider provider,
  ) {
    return call(
      accountLocalId: provider.accountLocalId,
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
  String? get name => r'listsPropertiesProvider';
}

/// See also [listsProperties].
class ListsPropertiesProvider
    extends AutoDisposeProvider<List<AccountListProperties>?> {
  /// See also [listsProperties].
  ListsPropertiesProvider({
    required String? accountLocalId,
  }) : this._internal(
          (ref) => listsProperties(
            ref as ListsPropertiesRef,
            accountLocalId: accountLocalId,
          ),
          from: listsPropertiesProvider,
          name: r'listsPropertiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listsPropertiesHash,
          dependencies: ListsPropertiesFamily._dependencies,
          allTransitiveDependencies:
              ListsPropertiesFamily._allTransitiveDependencies,
          accountLocalId: accountLocalId,
        );

  ListsPropertiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountLocalId,
  }) : super.internal();

  final String? accountLocalId;

  @override
  Override overrideWith(
    List<AccountListProperties>? Function(ListsPropertiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListsPropertiesProvider._internal(
        (ref) => create(ref as ListsPropertiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        accountLocalId: accountLocalId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<AccountListProperties>?> createElement() {
    return _ListsPropertiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListsPropertiesProvider &&
        other.accountLocalId == accountLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListsPropertiesRef
    on AutoDisposeProviderRef<List<AccountListProperties>?> {
  /// The parameter `accountLocalId` of this provider.
  String? get accountLocalId;
}

class _ListsPropertiesProviderElement
    extends AutoDisposeProviderElement<List<AccountListProperties>?>
    with ListsPropertiesRef {
  _ListsPropertiesProviderElement(super.provider);

  @override
  String? get accountLocalId =>
      (origin as ListsPropertiesProvider).accountLocalId;
}

String _$listsHash() => r'4a673a14aaedcb7c49dddc416273d8e7632f07cf';

/// See also [lists].
@ProviderFor(lists)
const listsProvider = ListsFamily();

/// See also [lists].
class ListsFamily extends Family<List<Liste>?> {
  /// See also [lists].
  const ListsFamily();

  /// See also [lists].
  ListsProvider call({
    required String? accountLocalId,
  }) {
    return ListsProvider(
      accountLocalId: accountLocalId,
    );
  }

  @override
  ListsProvider getProviderOverride(
    covariant ListsProvider provider,
  ) {
    return call(
      accountLocalId: provider.accountLocalId,
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
  String? get name => r'listsProvider';
}

/// See also [lists].
class ListsProvider extends AutoDisposeProvider<List<Liste>?> {
  /// See also [lists].
  ListsProvider({
    required String? accountLocalId,
  }) : this._internal(
          (ref) => lists(
            ref as ListsRef,
            accountLocalId: accountLocalId,
          ),
          from: listsProvider,
          name: r'listsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listsHash,
          dependencies: ListsFamily._dependencies,
          allTransitiveDependencies: ListsFamily._allTransitiveDependencies,
          accountLocalId: accountLocalId,
        );

  ListsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountLocalId,
  }) : super.internal();

  final String? accountLocalId;

  @override
  Override overrideWith(
    List<Liste>? Function(ListsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListsProvider._internal(
        (ref) => create(ref as ListsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        accountLocalId: accountLocalId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Liste>?> createElement() {
    return _ListsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListsProvider && other.accountLocalId == accountLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListsRef on AutoDisposeProviderRef<List<Liste>?> {
  /// The parameter `accountLocalId` of this provider.
  String? get accountLocalId;
}

class _ListsProviderElement extends AutoDisposeProviderElement<List<Liste>?>
    with ListsRef {
  _ListsProviderElement(super.provider);

  @override
  String? get accountLocalId => (origin as ListsProvider).accountLocalId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
