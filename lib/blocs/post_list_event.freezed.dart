// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function() refreshPosts,
    required TResult Function() loadMorePosts,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function()? refreshPosts,
    TResult? Function()? loadMorePosts,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function()? refreshPosts,
    TResult Function()? loadMorePosts,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPostsEvent value) loadPosts,
    required TResult Function(RefreshPostsEvent value) refreshPosts,
    required TResult Function(LoadMorePostsEvent value) loadMorePosts,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPostsEvent value)? loadPosts,
    TResult? Function(RefreshPostsEvent value)? refreshPosts,
    TResult? Function(LoadMorePostsEvent value)? loadMorePosts,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPostsEvent value)? loadPosts,
    TResult Function(RefreshPostsEvent value)? refreshPosts,
    TResult Function(LoadMorePostsEvent value)? loadMorePosts,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListEventCopyWith<$Res> {
  factory $PostListEventCopyWith(
    PostListEvent value,
    $Res Function(PostListEvent) then,
  ) = _$PostListEventCopyWithImpl<$Res, PostListEvent>;
}

/// @nodoc
class _$PostListEventCopyWithImpl<$Res, $Val extends PostListEvent>
    implements $PostListEventCopyWith<$Res> {
  _$PostListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadPostsEventImplCopyWith<$Res> {
  factory _$$LoadPostsEventImplCopyWith(
    _$LoadPostsEventImpl value,
    $Res Function(_$LoadPostsEventImpl) then,
  ) = __$$LoadPostsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPostsEventImplCopyWithImpl<$Res>
    extends _$PostListEventCopyWithImpl<$Res, _$LoadPostsEventImpl>
    implements _$$LoadPostsEventImplCopyWith<$Res> {
  __$$LoadPostsEventImplCopyWithImpl(
    _$LoadPostsEventImpl _value,
    $Res Function(_$LoadPostsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadPostsEventImpl implements LoadPostsEvent {
  const _$LoadPostsEventImpl();

  @override
  String toString() {
    return 'PostListEvent.loadPosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadPostsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function() refreshPosts,
    required TResult Function() loadMorePosts,
  }) {
    return loadPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function()? refreshPosts,
    TResult? Function()? loadMorePosts,
  }) {
    return loadPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function()? refreshPosts,
    TResult Function()? loadMorePosts,
    required TResult orElse(),
  }) {
    if (loadPosts != null) {
      return loadPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPostsEvent value) loadPosts,
    required TResult Function(RefreshPostsEvent value) refreshPosts,
    required TResult Function(LoadMorePostsEvent value) loadMorePosts,
  }) {
    return loadPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPostsEvent value)? loadPosts,
    TResult? Function(RefreshPostsEvent value)? refreshPosts,
    TResult? Function(LoadMorePostsEvent value)? loadMorePosts,
  }) {
    return loadPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPostsEvent value)? loadPosts,
    TResult Function(RefreshPostsEvent value)? refreshPosts,
    TResult Function(LoadMorePostsEvent value)? loadMorePosts,
    required TResult orElse(),
  }) {
    if (loadPosts != null) {
      return loadPosts(this);
    }
    return orElse();
  }
}

abstract class LoadPostsEvent implements PostListEvent {
  const factory LoadPostsEvent() = _$LoadPostsEventImpl;
}

/// @nodoc
abstract class _$$RefreshPostsEventImplCopyWith<$Res> {
  factory _$$RefreshPostsEventImplCopyWith(
    _$RefreshPostsEventImpl value,
    $Res Function(_$RefreshPostsEventImpl) then,
  ) = __$$RefreshPostsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshPostsEventImplCopyWithImpl<$Res>
    extends _$PostListEventCopyWithImpl<$Res, _$RefreshPostsEventImpl>
    implements _$$RefreshPostsEventImplCopyWith<$Res> {
  __$$RefreshPostsEventImplCopyWithImpl(
    _$RefreshPostsEventImpl _value,
    $Res Function(_$RefreshPostsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshPostsEventImpl implements RefreshPostsEvent {
  const _$RefreshPostsEventImpl();

  @override
  String toString() {
    return 'PostListEvent.refreshPosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshPostsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function() refreshPosts,
    required TResult Function() loadMorePosts,
  }) {
    return refreshPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function()? refreshPosts,
    TResult? Function()? loadMorePosts,
  }) {
    return refreshPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function()? refreshPosts,
    TResult Function()? loadMorePosts,
    required TResult orElse(),
  }) {
    if (refreshPosts != null) {
      return refreshPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPostsEvent value) loadPosts,
    required TResult Function(RefreshPostsEvent value) refreshPosts,
    required TResult Function(LoadMorePostsEvent value) loadMorePosts,
  }) {
    return refreshPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPostsEvent value)? loadPosts,
    TResult? Function(RefreshPostsEvent value)? refreshPosts,
    TResult? Function(LoadMorePostsEvent value)? loadMorePosts,
  }) {
    return refreshPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPostsEvent value)? loadPosts,
    TResult Function(RefreshPostsEvent value)? refreshPosts,
    TResult Function(LoadMorePostsEvent value)? loadMorePosts,
    required TResult orElse(),
  }) {
    if (refreshPosts != null) {
      return refreshPosts(this);
    }
    return orElse();
  }
}

abstract class RefreshPostsEvent implements PostListEvent {
  const factory RefreshPostsEvent() = _$RefreshPostsEventImpl;
}

/// @nodoc
abstract class _$$LoadMorePostsEventImplCopyWith<$Res> {
  factory _$$LoadMorePostsEventImplCopyWith(
    _$LoadMorePostsEventImpl value,
    $Res Function(_$LoadMorePostsEventImpl) then,
  ) = __$$LoadMorePostsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMorePostsEventImplCopyWithImpl<$Res>
    extends _$PostListEventCopyWithImpl<$Res, _$LoadMorePostsEventImpl>
    implements _$$LoadMorePostsEventImplCopyWith<$Res> {
  __$$LoadMorePostsEventImplCopyWithImpl(
    _$LoadMorePostsEventImpl _value,
    $Res Function(_$LoadMorePostsEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMorePostsEventImpl implements LoadMorePostsEvent {
  const _$LoadMorePostsEventImpl();

  @override
  String toString() {
    return 'PostListEvent.loadMorePosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMorePostsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadPosts,
    required TResult Function() refreshPosts,
    required TResult Function() loadMorePosts,
  }) {
    return loadMorePosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadPosts,
    TResult? Function()? refreshPosts,
    TResult? Function()? loadMorePosts,
  }) {
    return loadMorePosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadPosts,
    TResult Function()? refreshPosts,
    TResult Function()? loadMorePosts,
    required TResult orElse(),
  }) {
    if (loadMorePosts != null) {
      return loadMorePosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPostsEvent value) loadPosts,
    required TResult Function(RefreshPostsEvent value) refreshPosts,
    required TResult Function(LoadMorePostsEvent value) loadMorePosts,
  }) {
    return loadMorePosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPostsEvent value)? loadPosts,
    TResult? Function(RefreshPostsEvent value)? refreshPosts,
    TResult? Function(LoadMorePostsEvent value)? loadMorePosts,
  }) {
    return loadMorePosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPostsEvent value)? loadPosts,
    TResult Function(RefreshPostsEvent value)? refreshPosts,
    TResult Function(LoadMorePostsEvent value)? loadMorePosts,
    required TResult orElse(),
  }) {
    if (loadMorePosts != null) {
      return loadMorePosts(this);
    }
    return orElse();
  }
}

abstract class LoadMorePostsEvent implements PostListEvent {
  const factory LoadMorePostsEvent() = _$LoadMorePostsEventImpl;
}
