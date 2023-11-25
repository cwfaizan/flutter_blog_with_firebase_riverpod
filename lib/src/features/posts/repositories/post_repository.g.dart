// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postRepositoryHash() => r'd0eda540ed99b9930bd9400fbf69ae6b2adbf133';

/// See also [postRepository].
@ProviderFor(postRepository)
final postRepositoryProvider = Provider<PostRepository>.internal(
  postRepository,
  name: r'postRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostRepositoryRef = ProviderRef<PostRepository>;
String _$streamPostsListHash() => r'bb34e4b472dea2364784ed18ae27793079c77cfb';

/// See also [streamPostsList].
@ProviderFor(streamPostsList)
final streamPostsListProvider = AutoDisposeStreamProvider<List<Post>>.internal(
  streamPostsList,
  name: r'streamPostsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$streamPostsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StreamPostsListRef = AutoDisposeStreamProviderRef<List<Post>>;
String _$futurePostsListHash() => r'c53c7040d7424bf0f92e359c9933700896c117e5';

/// See also [futurePostsList].
@ProviderFor(futurePostsList)
final futurePostsListProvider = AutoDisposeFutureProvider<List<Post>>.internal(
  futurePostsList,
  name: r'futurePostsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$futurePostsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FuturePostsListRef = AutoDisposeFutureProviderRef<List<Post>>;
String _$streamPostHash() => r'6cbf184ffd068615c72499d5edbb567b6f79790b';

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

/// See also [streamPost].
@ProviderFor(streamPost)
const streamPostProvider = StreamPostFamily();

/// See also [streamPost].
class StreamPostFamily extends Family<AsyncValue<Post?>> {
  /// See also [streamPost].
  const StreamPostFamily();

  /// See also [streamPost].
  StreamPostProvider call(
    String id,
  ) {
    return StreamPostProvider(
      id,
    );
  }

  @override
  StreamPostProvider getProviderOverride(
    covariant StreamPostProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'streamPostProvider';
}

/// See also [streamPost].
class StreamPostProvider extends AutoDisposeStreamProvider<Post?> {
  /// See also [streamPost].
  StreamPostProvider(
    String id,
  ) : this._internal(
          (ref) => streamPost(
            ref as StreamPostRef,
            id,
          ),
          from: streamPostProvider,
          name: r'streamPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$streamPostHash,
          dependencies: StreamPostFamily._dependencies,
          allTransitiveDependencies:
              StreamPostFamily._allTransitiveDependencies,
          id: id,
        );

  StreamPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<Post?> Function(StreamPostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StreamPostProvider._internal(
        (ref) => create(ref as StreamPostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Post?> createElement() {
    return _StreamPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StreamPostProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StreamPostRef on AutoDisposeStreamProviderRef<Post?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _StreamPostProviderElement extends AutoDisposeStreamProviderElement<Post?>
    with StreamPostRef {
  _StreamPostProviderElement(super.provider);

  @override
  String get id => (origin as StreamPostProvider).id;
}

String _$futurePostHash() => r'3c3bda250b6371b2cdafd3cbde602227c01255de';

/// See also [futurePost].
@ProviderFor(futurePost)
const futurePostProvider = FuturePostFamily();

/// See also [futurePost].
class FuturePostFamily extends Family<AsyncValue<Post?>> {
  /// See also [futurePost].
  const FuturePostFamily();

  /// See also [futurePost].
  FuturePostProvider call(
    String id,
  ) {
    return FuturePostProvider(
      id,
    );
  }

  @override
  FuturePostProvider getProviderOverride(
    covariant FuturePostProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'futurePostProvider';
}

/// See also [futurePost].
class FuturePostProvider extends AutoDisposeFutureProvider<Post?> {
  /// See also [futurePost].
  FuturePostProvider(
    String id,
  ) : this._internal(
          (ref) => futurePost(
            ref as FuturePostRef,
            id,
          ),
          from: futurePostProvider,
          name: r'futurePostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$futurePostHash,
          dependencies: FuturePostFamily._dependencies,
          allTransitiveDependencies:
              FuturePostFamily._allTransitiveDependencies,
          id: id,
        );

  FuturePostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Post?> Function(FuturePostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FuturePostProvider._internal(
        (ref) => create(ref as FuturePostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Post?> createElement() {
    return _FuturePostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FuturePostProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FuturePostRef on AutoDisposeFutureProviderRef<Post?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _FuturePostProviderElement extends AutoDisposeFutureProviderElement<Post?>
    with FuturePostRef {
  _FuturePostProviderElement(super.provider);

  @override
  String get id => (origin as FuturePostProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
