// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localAccountHash() => r'd224705c671d94f0777d1a97818e70c0221ddd97';

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

/// See also [localAccount].
@ProviderFor(localAccount)
const localAccountProvider = LocalAccountFamily();

/// See also [localAccount].
class LocalAccountFamily extends Family<Account?> {
  /// See also [localAccount].
  const LocalAccountFamily();

  /// See also [localAccount].
  LocalAccountProvider call({
    required String? accountId,
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
    required String? accountId,
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

  final String? accountId;

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
  String? get accountId;
}

class _LocalAccountProviderElement extends AutoDisposeProviderElement<Account?>
    with LocalAccountRef {
  _LocalAccountProviderElement(super.provider);

  @override
  String? get accountId => (origin as LocalAccountProvider).accountId;
}

String _$accountPropertiesHash() => r'07e0d9ae6fe342dc12805d6f32f5ebd896a2f9bd';

/// See also [accountProperties].
@ProviderFor(accountProperties)
const accountPropertiesProvider = AccountPropertiesFamily();

/// See also [accountProperties].
class AccountPropertiesFamily extends Family<AccountProperties?> {
  /// See also [accountProperties].
  const AccountPropertiesFamily();

  /// See also [accountProperties].
  AccountPropertiesProvider call({
    required String? propertiesId,
  }) {
    return AccountPropertiesProvider(
      propertiesId: propertiesId,
    );
  }

  @override
  AccountPropertiesProvider getProviderOverride(
    covariant AccountPropertiesProvider provider,
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
  String? get name => r'accountPropertiesProvider';
}

/// See also [accountProperties].
class AccountPropertiesProvider
    extends AutoDisposeProvider<AccountProperties?> {
  /// See also [accountProperties].
  AccountPropertiesProvider({
    required String? propertiesId,
  }) : this._internal(
          (ref) => accountProperties(
            ref as AccountPropertiesRef,
            propertiesId: propertiesId,
          ),
          from: accountPropertiesProvider,
          name: r'accountPropertiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accountPropertiesHash,
          dependencies: AccountPropertiesFamily._dependencies,
          allTransitiveDependencies:
              AccountPropertiesFamily._allTransitiveDependencies,
          propertiesId: propertiesId,
        );

  AccountPropertiesProvider._internal(
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
    AccountProperties? Function(AccountPropertiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccountPropertiesProvider._internal(
        (ref) => create(ref as AccountPropertiesRef),
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
  AutoDisposeProviderElement<AccountProperties?> createElement() {
    return _AccountPropertiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountPropertiesProvider &&
        other.propertiesId == propertiesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, propertiesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccountPropertiesRef on AutoDisposeProviderRef<AccountProperties?> {
  /// The parameter `propertiesId` of this provider.
  String? get propertiesId;
}

class _AccountPropertiesProviderElement
    extends AutoDisposeProviderElement<AccountProperties?>
    with AccountPropertiesRef {
  _AccountPropertiesProviderElement(super.provider);

  @override
  String? get propertiesId =>
      (origin as AccountPropertiesProvider).propertiesId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
