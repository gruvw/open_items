// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

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

String _$collectionHash() => r'9fb112896d7d935ac1b057400a442f00ae5d052b';

/// See also [collection].
@ProviderFor(collection)
const collectionProvider = CollectionFamily();

/// See also [collection].
class CollectionFamily extends Family<Collection?> {
  /// See also [collection].
  const CollectionFamily();

  /// See also [collection].
  CollectionProvider call({
    required String? collectionId,
  }) {
    return CollectionProvider(
      collectionId: collectionId,
    );
  }

  @override
  CollectionProvider getProviderOverride(
    covariant CollectionProvider provider,
  ) {
    return call(
      collectionId: provider.collectionId,
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
  String? get name => r'collectionProvider';
}

/// See also [collection].
class CollectionProvider extends AutoDisposeProvider<Collection?> {
  /// See also [collection].
  CollectionProvider({
    required String? collectionId,
  }) : this._internal(
          (ref) => collection(
            ref as CollectionRef,
            collectionId: collectionId,
          ),
          from: collectionProvider,
          name: r'collectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$collectionHash,
          dependencies: CollectionFamily._dependencies,
          allTransitiveDependencies:
              CollectionFamily._allTransitiveDependencies,
          collectionId: collectionId,
        );

  CollectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
  }) : super.internal();

  final String? collectionId;

  @override
  Override overrideWith(
    Collection? Function(CollectionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CollectionProvider._internal(
        (ref) => create(ref as CollectionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Collection?> createElement() {
    return _CollectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionProvider && other.collectionId == collectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CollectionRef on AutoDisposeProviderRef<Collection?> {
  /// The parameter `collectionId` of this provider.
  String? get collectionId;
}

class _CollectionProviderElement extends AutoDisposeProviderElement<Collection?>
    with CollectionRef {
  _CollectionProviderElement(super.provider);

  @override
  String? get collectionId => (origin as CollectionProvider).collectionId;
}

String _$listHash() => r'c535ef39c411543f6cdfd75f880434a653daa2a0';

/// See also [list].
@ProviderFor(list)
const listProvider = ListFamily();

/// See also [list].
class ListFamily extends Family<Liste?> {
  /// See also [list].
  const ListFamily();

  /// See also [list].
  ListProvider call({
    required String? listId,
  }) {
    return ListProvider(
      listId: listId,
    );
  }

  @override
  ListProvider getProviderOverride(
    covariant ListProvider provider,
  ) {
    return call(
      listId: provider.listId,
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
    required String? listId,
  }) : this._internal(
          (ref) => list(
            ref as ListRef,
            listId: listId,
          ),
          from: listProvider,
          name: r'listProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$listHash,
          dependencies: ListFamily._dependencies,
          allTransitiveDependencies: ListFamily._allTransitiveDependencies,
          listId: listId,
        );

  ListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listId,
  }) : super.internal();

  final String? listId;

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
        listId: listId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Liste?> createElement() {
    return _ListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListProvider && other.listId == listId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListRef on AutoDisposeProviderRef<Liste?> {
  /// The parameter `listId` of this provider.
  String? get listId;
}

class _ListProviderElement extends AutoDisposeProviderElement<Liste?>
    with ListRef {
  _ListProviderElement(super.provider);

  @override
  String? get listId => (origin as ListProvider).listId;
}

String _$itemHash() => r'3c99f781eca0544a0ee927e909a32b1a3bd01e71';

/// See also [item].
@ProviderFor(item)
const itemProvider = ItemFamily();

/// See also [item].
class ItemFamily extends Family<Item?> {
  /// See also [item].
  const ItemFamily();

  /// See also [item].
  ItemProvider call({
    required String? itemId,
  }) {
    return ItemProvider(
      itemId: itemId,
    );
  }

  @override
  ItemProvider getProviderOverride(
    covariant ItemProvider provider,
  ) {
    return call(
      itemId: provider.itemId,
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
  String? get name => r'itemProvider';
}

/// See also [item].
class ItemProvider extends AutoDisposeProvider<Item?> {
  /// See also [item].
  ItemProvider({
    required String? itemId,
  }) : this._internal(
          (ref) => item(
            ref as ItemRef,
            itemId: itemId,
          ),
          from: itemProvider,
          name: r'itemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$itemHash,
          dependencies: ItemFamily._dependencies,
          allTransitiveDependencies: ItemFamily._allTransitiveDependencies,
          itemId: itemId,
        );

  ItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemId,
  }) : super.internal();

  final String? itemId;

  @override
  Override overrideWith(
    Item? Function(ItemRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ItemProvider._internal(
        (ref) => create(ref as ItemRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        itemId: itemId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Item?> createElement() {
    return _ItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemProvider && other.itemId == itemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ItemRef on AutoDisposeProviderRef<Item?> {
  /// The parameter `itemId` of this provider.
  String? get itemId;
}

class _ItemProviderElement extends AutoDisposeProviderElement<Item?>
    with ItemRef {
  _ItemProviderElement(super.provider);

  @override
  String? get itemId => (origin as ItemProvider).itemId;
}

String _$itemsHash() => r'ced8c9a87e3ce1c1c71dceb58ad3ada7e92b2b5e';

/// See also [items].
@ProviderFor(items)
const itemsProvider = ItemsFamily();

/// See also [items].
class ItemsFamily extends Family<List<Item>?> {
  /// See also [items].
  const ItemsFamily();

  /// See also [items].
  ItemsProvider call({
    required String? listPropertiesId,
    required String? parentId,
  }) {
    return ItemsProvider(
      listPropertiesId: listPropertiesId,
      parentId: parentId,
    );
  }

  @override
  ItemsProvider getProviderOverride(
    covariant ItemsProvider provider,
  ) {
    return call(
      listPropertiesId: provider.listPropertiesId,
      parentId: provider.parentId,
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
  String? get name => r'itemsProvider';
}

/// See also [items].
class ItemsProvider extends AutoDisposeProvider<List<Item>?> {
  /// See also [items].
  ItemsProvider({
    required String? listPropertiesId,
    required String? parentId,
  }) : this._internal(
          (ref) => items(
            ref as ItemsRef,
            listPropertiesId: listPropertiesId,
            parentId: parentId,
          ),
          from: itemsProvider,
          name: r'itemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$itemsHash,
          dependencies: ItemsFamily._dependencies,
          allTransitiveDependencies: ItemsFamily._allTransitiveDependencies,
          listPropertiesId: listPropertiesId,
          parentId: parentId,
        );

  ItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listPropertiesId,
    required this.parentId,
  }) : super.internal();

  final String? listPropertiesId;
  final String? parentId;

  @override
  Override overrideWith(
    List<Item>? Function(ItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ItemsProvider._internal(
        (ref) => create(ref as ItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        listPropertiesId: listPropertiesId,
        parentId: parentId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Item>?> createElement() {
    return _ItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemsProvider &&
        other.listPropertiesId == listPropertiesId &&
        other.parentId == parentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listPropertiesId.hashCode);
    hash = _SystemHash.combine(hash, parentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ItemsRef on AutoDisposeProviderRef<List<Item>?> {
  /// The parameter `listPropertiesId` of this provider.
  String? get listPropertiesId;

  /// The parameter `parentId` of this provider.
  String? get parentId;
}

class _ItemsProviderElement extends AutoDisposeProviderElement<List<Item>?>
    with ItemsRef {
  _ItemsProviderElement(super.provider);

  @override
  String? get listPropertiesId => (origin as ItemsProvider).listPropertiesId;
  @override
  String? get parentId => (origin as ItemsProvider).parentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
