// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountListPropertiesHash() =>
    r'3bdca79539d14ee6bb71d77f96609d650be728f6';

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
    required String? propertiesLocalId,
  }) {
    return AccountListPropertiesProvider(
      propertiesLocalId: propertiesLocalId,
    );
  }

  @override
  AccountListPropertiesProvider getProviderOverride(
    covariant AccountListPropertiesProvider provider,
  ) {
    return call(
      propertiesLocalId: provider.propertiesLocalId,
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
    required String? propertiesLocalId,
  }) : this._internal(
          (ref) => accountListProperties(
            ref as AccountListPropertiesRef,
            propertiesLocalId: propertiesLocalId,
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
          propertiesLocalId: propertiesLocalId,
        );

  AccountListPropertiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.propertiesLocalId,
  }) : super.internal();

  final String? propertiesLocalId;

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
        propertiesLocalId: propertiesLocalId,
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
        other.propertiesLocalId == propertiesLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, propertiesLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccountListPropertiesRef
    on AutoDisposeProviderRef<AccountListProperties?> {
  /// The parameter `propertiesLocalId` of this provider.
  String? get propertiesLocalId;
}

class _AccountListPropertiesProviderElement
    extends AutoDisposeProviderElement<AccountListProperties?>
    with AccountListPropertiesRef {
  _AccountListPropertiesProviderElement(super.provider);

  @override
  String? get propertiesLocalId =>
      (origin as AccountListPropertiesProvider).propertiesLocalId;
}

String _$collectionHash() => r'f369d04c5f469daac19cbfda396674ca9c3f7d1c';

/// See also [collection].
@ProviderFor(collection)
const collectionProvider = CollectionFamily();

/// See also [collection].
class CollectionFamily extends Family<Collection?> {
  /// See also [collection].
  const CollectionFamily();

  /// See also [collection].
  CollectionProvider call({
    required String? collectionLocalId,
  }) {
    return CollectionProvider(
      collectionLocalId: collectionLocalId,
    );
  }

  @override
  CollectionProvider getProviderOverride(
    covariant CollectionProvider provider,
  ) {
    return call(
      collectionLocalId: provider.collectionLocalId,
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
    required String? collectionLocalId,
  }) : this._internal(
          (ref) => collection(
            ref as CollectionRef,
            collectionLocalId: collectionLocalId,
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
          collectionLocalId: collectionLocalId,
        );

  CollectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionLocalId,
  }) : super.internal();

  final String? collectionLocalId;

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
        collectionLocalId: collectionLocalId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Collection?> createElement() {
    return _CollectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionProvider &&
        other.collectionLocalId == collectionLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CollectionRef on AutoDisposeProviderRef<Collection?> {
  /// The parameter `collectionLocalId` of this provider.
  String? get collectionLocalId;
}

class _CollectionProviderElement extends AutoDisposeProviderElement<Collection?>
    with CollectionRef {
  _CollectionProviderElement(super.provider);

  @override
  String? get collectionLocalId =>
      (origin as CollectionProvider).collectionLocalId;
}

String _$listHash() => r'ff5f770218ec62ed968b089b62bdabfcb186101d';

/// See also [list].
@ProviderFor(list)
const listProvider = ListFamily();

/// See also [list].
class ListFamily extends Family<Liste?> {
  /// See also [list].
  const ListFamily();

  /// See also [list].
  ListProvider call({
    required String? listLocalId,
  }) {
    return ListProvider(
      listLocalId: listLocalId,
    );
  }

  @override
  ListProvider getProviderOverride(
    covariant ListProvider provider,
  ) {
    return call(
      listLocalId: provider.listLocalId,
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
    required String? listLocalId,
  }) : this._internal(
          (ref) => list(
            ref as ListRef,
            listLocalId: listLocalId,
          ),
          from: listProvider,
          name: r'listProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$listHash,
          dependencies: ListFamily._dependencies,
          allTransitiveDependencies: ListFamily._allTransitiveDependencies,
          listLocalId: listLocalId,
        );

  ListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listLocalId,
  }) : super.internal();

  final String? listLocalId;

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
        listLocalId: listLocalId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Liste?> createElement() {
    return _ListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListProvider && other.listLocalId == listLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListRef on AutoDisposeProviderRef<Liste?> {
  /// The parameter `listLocalId` of this provider.
  String? get listLocalId;
}

class _ListProviderElement extends AutoDisposeProviderElement<Liste?>
    with ListRef {
  _ListProviderElement(super.provider);

  @override
  String? get listLocalId => (origin as ListProvider).listLocalId;
}

String _$itemHash() => r'fcbc36834ce73a80f4f37c7ce4d7308b0ea25460';

/// See also [item].
@ProviderFor(item)
const itemProvider = ItemFamily();

/// See also [item].
class ItemFamily extends Family<Item?> {
  /// See also [item].
  const ItemFamily();

  /// See also [item].
  ItemProvider call({
    required String? itemLocalId,
  }) {
    return ItemProvider(
      itemLocalId: itemLocalId,
    );
  }

  @override
  ItemProvider getProviderOverride(
    covariant ItemProvider provider,
  ) {
    return call(
      itemLocalId: provider.itemLocalId,
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
    required String? itemLocalId,
  }) : this._internal(
          (ref) => item(
            ref as ItemRef,
            itemLocalId: itemLocalId,
          ),
          from: itemProvider,
          name: r'itemProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$itemHash,
          dependencies: ItemFamily._dependencies,
          allTransitiveDependencies: ItemFamily._allTransitiveDependencies,
          itemLocalId: itemLocalId,
        );

  ItemProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemLocalId,
  }) : super.internal();

  final String? itemLocalId;

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
        itemLocalId: itemLocalId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Item?> createElement() {
    return _ItemProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemProvider && other.itemLocalId == itemLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ItemRef on AutoDisposeProviderRef<Item?> {
  /// The parameter `itemLocalId` of this provider.
  String? get itemLocalId;
}

class _ItemProviderElement extends AutoDisposeProviderElement<Item?>
    with ItemRef {
  _ItemProviderElement(super.provider);

  @override
  String? get itemLocalId => (origin as ItemProvider).itemLocalId;
}

String _$itemsHash() => r'f6523d31ad4d902479ca89a5cebcb1911aabca3e';

/// See also [items].
@ProviderFor(items)
const itemsProvider = ItemsFamily();

/// See also [items].
class ItemsFamily extends Family<List<Item>?> {
  /// See also [items].
  const ItemsFamily();

  /// See also [items].
  ItemsProvider call({
    required String? listPropertiesLocalId,
    required String? parentLocalId,
  }) {
    return ItemsProvider(
      listPropertiesLocalId: listPropertiesLocalId,
      parentLocalId: parentLocalId,
    );
  }

  @override
  ItemsProvider getProviderOverride(
    covariant ItemsProvider provider,
  ) {
    return call(
      listPropertiesLocalId: provider.listPropertiesLocalId,
      parentLocalId: provider.parentLocalId,
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
    required String? listPropertiesLocalId,
    required String? parentLocalId,
  }) : this._internal(
          (ref) => items(
            ref as ItemsRef,
            listPropertiesLocalId: listPropertiesLocalId,
            parentLocalId: parentLocalId,
          ),
          from: itemsProvider,
          name: r'itemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$itemsHash,
          dependencies: ItemsFamily._dependencies,
          allTransitiveDependencies: ItemsFamily._allTransitiveDependencies,
          listPropertiesLocalId: listPropertiesLocalId,
          parentLocalId: parentLocalId,
        );

  ItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listPropertiesLocalId,
    required this.parentLocalId,
  }) : super.internal();

  final String? listPropertiesLocalId;
  final String? parentLocalId;

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
        listPropertiesLocalId: listPropertiesLocalId,
        parentLocalId: parentLocalId,
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
        other.listPropertiesLocalId == listPropertiesLocalId &&
        other.parentLocalId == parentLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listPropertiesLocalId.hashCode);
    hash = _SystemHash.combine(hash, parentLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ItemsRef on AutoDisposeProviderRef<List<Item>?> {
  /// The parameter `listPropertiesLocalId` of this provider.
  String? get listPropertiesLocalId;

  /// The parameter `parentLocalId` of this provider.
  String? get parentLocalId;
}

class _ItemsProviderElement extends AutoDisposeProviderElement<List<Item>?>
    with ItemsRef {
  _ItemsProviderElement(super.provider);

  @override
  String? get listPropertiesLocalId =>
      (origin as ItemsProvider).listPropertiesLocalId;
  @override
  String? get parentLocalId => (origin as ItemsProvider).parentLocalId;
}

String _$parentHash() => r'f204b90fbba6fdfc17e68672173e7d6829e4a3be';

/// See also [parent].
@ProviderFor(parent)
const parentProvider = ParentFamily();

/// See also [parent].
class ParentFamily extends Family<Collection?> {
  /// See also [parent].
  const ParentFamily();

  /// See also [parent].
  ParentProvider call({
    required String? itemLocalId,
  }) {
    return ParentProvider(
      itemLocalId: itemLocalId,
    );
  }

  @override
  ParentProvider getProviderOverride(
    covariant ParentProvider provider,
  ) {
    return call(
      itemLocalId: provider.itemLocalId,
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
  String? get name => r'parentProvider';
}

/// See also [parent].
class ParentProvider extends AutoDisposeProvider<Collection?> {
  /// See also [parent].
  ParentProvider({
    required String? itemLocalId,
  }) : this._internal(
          (ref) => parent(
            ref as ParentRef,
            itemLocalId: itemLocalId,
          ),
          from: parentProvider,
          name: r'parentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$parentHash,
          dependencies: ParentFamily._dependencies,
          allTransitiveDependencies: ParentFamily._allTransitiveDependencies,
          itemLocalId: itemLocalId,
        );

  ParentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemLocalId,
  }) : super.internal();

  final String? itemLocalId;

  @override
  Override overrideWith(
    Collection? Function(ParentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParentProvider._internal(
        (ref) => create(ref as ParentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        itemLocalId: itemLocalId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Collection?> createElement() {
    return _ParentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParentProvider && other.itemLocalId == itemLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ParentRef on AutoDisposeProviderRef<Collection?> {
  /// The parameter `itemLocalId` of this provider.
  String? get itemLocalId;
}

class _ParentProviderElement extends AutoDisposeProviderElement<Collection?>
    with ParentRef {
  _ParentProviderElement(super.provider);

  @override
  String? get itemLocalId => (origin as ParentProvider).itemLocalId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
