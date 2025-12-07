// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_list_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PostListBlocState {
  List<Post> get posts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Create a copy of PostListBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostListBlocStateCopyWith<PostListBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListBlocStateCopyWith<$Res> {
  factory $PostListBlocStateCopyWith(
    PostListBlocState value,
    $Res Function(PostListBlocState) then,
  ) = _$PostListBlocStateCopyWithImpl<$Res, PostListBlocState>;
  @useResult
  $Res call({
    List<Post> posts,
    bool isLoading,
    bool isLoadingMore,
    bool hasError,
    String errorMessage,
    int currentPage,
    bool hasMore,
  });
}

/// @nodoc
class _$PostListBlocStateCopyWithImpl<$Res, $Val extends PostListBlocState>
    implements $PostListBlocStateCopyWith<$Res> {
  _$PostListBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostListBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? currentPage = null,
    Object? hasMore = null,
  }) {
    return _then(
      _value.copyWith(
            posts: null == posts
                ? _value.posts
                : posts // ignore: cast_nullable_to_non_nullable
                      as List<Post>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasError: null == hasError
                ? _value.hasError
                : hasError // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: null == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostListBlocStateImplCopyWith<$Res>
    implements $PostListBlocStateCopyWith<$Res> {
  factory _$$PostListBlocStateImplCopyWith(
    _$PostListBlocStateImpl value,
    $Res Function(_$PostListBlocStateImpl) then,
  ) = __$$PostListBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Post> posts,
    bool isLoading,
    bool isLoadingMore,
    bool hasError,
    String errorMessage,
    int currentPage,
    bool hasMore,
  });
}

/// @nodoc
class __$$PostListBlocStateImplCopyWithImpl<$Res>
    extends _$PostListBlocStateCopyWithImpl<$Res, _$PostListBlocStateImpl>
    implements _$$PostListBlocStateImplCopyWith<$Res> {
  __$$PostListBlocStateImplCopyWithImpl(
    _$PostListBlocStateImpl _value,
    $Res Function(_$PostListBlocStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostListBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? isLoading = null,
    Object? isLoadingMore = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? currentPage = null,
    Object? hasMore = null,
  }) {
    return _then(
      _$PostListBlocStateImpl(
        posts: null == posts
            ? _value._posts
            : posts // ignore: cast_nullable_to_non_nullable
                  as List<Post>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasError: null == hasError
            ? _value.hasError
            : hasError // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$PostListBlocStateImpl implements _PostListBlocState {
  const _$PostListBlocStateImpl({
    final List<Post> posts = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasError = false,
    this.errorMessage = '',
    this.currentPage = 1,
    this.hasMore = false,
  }) : _posts = posts;

  final List<Post> _posts;
  @override
  @JsonKey()
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool hasMore;

  @override
  String toString() {
    return 'PostListBlocState(posts: $posts, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasError: $hasError, errorMessage: $errorMessage, currentPage: $currentPage, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostListBlocStateImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_posts),
    isLoading,
    isLoadingMore,
    hasError,
    errorMessage,
    currentPage,
    hasMore,
  );

  /// Create a copy of PostListBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostListBlocStateImplCopyWith<_$PostListBlocStateImpl> get copyWith =>
      __$$PostListBlocStateImplCopyWithImpl<_$PostListBlocStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PostListBlocState implements PostListBlocState {
  const factory _PostListBlocState({
    final List<Post> posts,
    final bool isLoading,
    final bool isLoadingMore,
    final bool hasError,
    final String errorMessage,
    final int currentPage,
    final bool hasMore,
  }) = _$PostListBlocStateImpl;

  @override
  List<Post> get posts;
  @override
  bool get isLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  int get currentPage;
  @override
  bool get hasMore;

  /// Create a copy of PostListBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostListBlocStateImplCopyWith<_$PostListBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
