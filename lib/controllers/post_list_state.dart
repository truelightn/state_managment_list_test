import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/post.dart';

part 'post_list_state.freezed.dart';

@freezed
class PostListState with _$PostListState {
  const factory PostListState({
    @Default([]) List<Post> posts,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
  }) = _PostListState;
}

