// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$objectEventsHash() => r'a084c25e6c6a37e4d0d550ced7991e3d174ea6f2';

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

/// See also [objectEvents].
@ProviderFor(objectEvents)
const objectEventsProvider = ObjectEventsFamily();

/// See also [objectEvents].
class ObjectEventsFamily extends Family<AsyncValue<Event<DatabaseObject>>> {
  /// See also [objectEvents].
  const ObjectEventsFamily();

  /// See also [objectEvents].
  ObjectEventsProvider call({
    required String? localId,
  }) {
    return ObjectEventsProvider(
      localId: localId,
    );
  }

  @override
  ObjectEventsProvider getProviderOverride(
    covariant ObjectEventsProvider provider,
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
  String? get name => r'objectEventsProvider';
}

/// See also [objectEvents].
class ObjectEventsProvider
    extends AutoDisposeStreamProvider<Event<DatabaseObject>> {
  /// See also [objectEvents].
  ObjectEventsProvider({
    required String? localId,
  }) : this._internal(
          (ref) => objectEvents(
            ref as ObjectEventsRef,
            localId: localId,
          ),
          from: objectEventsProvider,
          name: r'objectEventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$objectEventsHash,
          dependencies: ObjectEventsFamily._dependencies,
          allTransitiveDependencies:
              ObjectEventsFamily._allTransitiveDependencies,
          localId: localId,
        );

  ObjectEventsProvider._internal(
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
    Stream<Event<DatabaseObject>> Function(ObjectEventsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ObjectEventsProvider._internal(
        (ref) => create(ref as ObjectEventsRef),
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
  AutoDisposeStreamProviderElement<Event<DatabaseObject>> createElement() {
    return _ObjectEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ObjectEventsProvider && other.localId == localId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, localId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ObjectEventsRef on AutoDisposeStreamProviderRef<Event<DatabaseObject>> {
  /// The parameter `localId` of this provider.
  String? get localId;
}

class _ObjectEventsProviderElement
    extends AutoDisposeStreamProviderElement<Event<DatabaseObject>>
    with ObjectEventsRef {
  _ObjectEventsProviderElement(super.provider);

  @override
  String? get localId => (origin as ObjectEventsProvider).localId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
