// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localAccountHash() => r'7ff7b66572d50735b529eeb5ff89719266e64379';

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
    required String? accountLocalId,
  }) {
    return LocalAccountProvider(
      accountLocalId: accountLocalId,
    );
  }

  @override
  LocalAccountProvider getProviderOverride(
    covariant LocalAccountProvider provider,
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
  String? get name => r'localAccountProvider';
}

/// See also [localAccount].
class LocalAccountProvider extends AutoDisposeProvider<Account?> {
  /// See also [localAccount].
  LocalAccountProvider({
    required String? accountLocalId,
  }) : this._internal(
          (ref) => localAccount(
            ref as LocalAccountRef,
            accountLocalId: accountLocalId,
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
          accountLocalId: accountLocalId,
        );

  LocalAccountProvider._internal(
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
        accountLocalId: accountLocalId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Account?> createElement() {
    return _LocalAccountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalAccountProvider &&
        other.accountLocalId == accountLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocalAccountRef on AutoDisposeProviderRef<Account?> {
  /// The parameter `accountLocalId` of this provider.
  String? get accountLocalId;
}

class _LocalAccountProviderElement extends AutoDisposeProviderElement<Account?>
    with LocalAccountRef {
  _LocalAccountProviderElement(super.provider);

  @override
  String? get accountLocalId => (origin as LocalAccountProvider).accountLocalId;
}

String _$accountPropertiesHash() => r'a96dcb9619e1e601a46164aa5170860db4640341';

/// See also [accountProperties].
@ProviderFor(accountProperties)
const accountPropertiesProvider = AccountPropertiesFamily();

/// See also [accountProperties].
class AccountPropertiesFamily extends Family<AccountProperties?> {
  /// See also [accountProperties].
  const AccountPropertiesFamily();

  /// See also [accountProperties].
  AccountPropertiesProvider call({
    required String? accountLocalId,
  }) {
    return AccountPropertiesProvider(
      accountLocalId: accountLocalId,
    );
  }

  @override
  AccountPropertiesProvider getProviderOverride(
    covariant AccountPropertiesProvider provider,
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
  String? get name => r'accountPropertiesProvider';
}

/// See also [accountProperties].
class AccountPropertiesProvider
    extends AutoDisposeProvider<AccountProperties?> {
  /// See also [accountProperties].
  AccountPropertiesProvider({
    required String? accountLocalId,
  }) : this._internal(
          (ref) => accountProperties(
            ref as AccountPropertiesRef,
            accountLocalId: accountLocalId,
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
          accountLocalId: accountLocalId,
        );

  AccountPropertiesProvider._internal(
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
        accountLocalId: accountLocalId,
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
        other.accountLocalId == accountLocalId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountLocalId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AccountPropertiesRef on AutoDisposeProviderRef<AccountProperties?> {
  /// The parameter `accountLocalId` of this provider.
  String? get accountLocalId;
}

class _AccountPropertiesProviderElement
    extends AutoDisposeProviderElement<AccountProperties?>
    with AccountPropertiesRef {
  _AccountPropertiesProviderElement(super.provider);

  @override
  String? get accountLocalId =>
      (origin as AccountPropertiesProvider).accountLocalId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
