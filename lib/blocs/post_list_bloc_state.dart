import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/post.dart';

part 'post_list_bloc_state.freezed.dart';

@freezed
sealed class PostListBlocState with _$PostListBlocState {
  const factory PostListBlocState.initial() = _Initial;
  const factory PostListBlocState.loading() = _Loading;
  const factory PostListBlocState.loaded({required List<Post> posts, required int currentPage, required bool hasMore}) =
      _Loaded;
  const factory PostListBlocState.loadingMore({
    required List<Post> posts,
    required int currentPage,
    required bool hasMore,
  }) = _LoadingMore;
  const factory PostListBlocState.error({required String errorMessage, List<Post>? posts}) = _Error;
}
