// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listsPropertiesHash() => r'd87a9e6e888d257cf4565a155fb49e2b6b2fd2bc';

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
    required String? accountId,
  }) {
    return ListsPropertiesProvider(
      accountId: accountId,
    );
  }

  @override
  ListsPropertiesProvider getProviderOverride(
    covariant ListsPropertiesProvider provider,
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
  String? get name => r'listsPropertiesProvider';
}

/// See also [listsProperties].
class ListsPropertiesProvider
    extends AutoDisposeProvider<List<AccountListProperties>?> {
  /// See also [listsProperties].
  ListsPropertiesProvider({
    required String? accountId,
  }) : this._internal(
          (ref) => listsProperties(
            ref as ListsPropertiesRef,
            accountId: accountId,
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
          accountId: accountId,
        );

  ListsPropertiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountId,
  }) : super.internal();

  final String? accountId;

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
        accountId: accountId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<AccountListProperties>?> createElement() {
    return _ListsPropertiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListsPropertiesProvider && other.accountId == accountId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListsPropertiesRef
    on AutoDisposeProviderRef<List<AccountListProperties>?> {
  /// The parameter `accountId` of this provider.
  String? get accountId;
}

class _ListsPropertiesProviderElement
    extends AutoDisposeProviderElement<List<AccountListProperties>?>
    with ListsPropertiesRef {
  _ListsPropertiesProviderElement(super.provider);

  @override
  String? get accountId => (origin as ListsPropertiesProvider).accountId;
}

String _$listsHash() => r'b5994cdaea65c1201764d4074760c7d071c61f21';

/// See also [lists].
@ProviderFor(lists)
const listsProvider = ListsFamily();

/// See also [lists].
class ListsFamily extends Family<List<Liste>?> {
  /// See also [lists].
  const ListsFamily();

  /// See also [lists].
  ListsProvider call({
    required String? accountId,
  }) {
    return ListsProvider(
      accountId: accountId,
    );
  }

  @override
  ListsProvider getProviderOverride(
    covariant ListsProvider provider,
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
  String? get name => r'listsProvider';
}

/// See also [lists].
class ListsProvider extends AutoDisposeProvider<List<Liste>?> {
  /// See also [lists].
  ListsProvider({
    required String? accountId,
  }) : this._internal(
          (ref) => lists(
            ref as ListsRef,
            accountId: accountId,
          ),
          from: listsProvider,
          name: r'listsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listsHash,
          dependencies: ListsFamily._dependencies,
          allTransitiveDependencies: ListsFamily._allTransitiveDependencies,
          accountId: accountId,
        );

  ListsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountId,
  }) : super.internal();

  final String? accountId;

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
        accountId: accountId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Liste>?> createElement() {
    return _ListsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListsProvider && other.accountId == accountId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListsRef on AutoDisposeProviderRef<List<Liste>?> {
  /// The parameter `accountId` of this provider.
  String? get accountId;
}

class _ListsProviderElement extends AutoDisposeProviderElement<List<Liste>?>
    with ListsRef {
  _ListsProviderElement(super.provider);

  @override
  String? get accountId => (origin as ListsProvider).accountId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
