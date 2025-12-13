import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_event.freezed.dart';

@freezed
sealed class PostListEvent with _$PostListEvent {
  const factory PostListEvent.loadPosts() = LoadPostsEvent;
  const factory PostListEvent.refreshPosts() = RefreshPostsEvent;
  const factory PostListEvent.loadMorePosts() = LoadMorePostsEvent;
}
