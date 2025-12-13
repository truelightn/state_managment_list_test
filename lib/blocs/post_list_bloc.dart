import 'package:flutter_bloc/flutter_bloc.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';
import '../services/api_service.dart';
import 'post_list_event.dart';
import 'post_list_bloc_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListBlocState> {
  final PostRepository _repository;
  static const int _pageSize = 10;

  PostListBloc({PostRepository? repository})
    : _repository = repository ?? PostRepository(ApiService()),
      super(const PostListBlocState.initial()) {
    on<LoadPostsEvent>(_onLoadPosts);
    on<RefreshPostsEvent>(_onRefreshPosts);
    on<LoadMorePostsEvent>(_onLoadMorePosts);
    add(const PostListEvent.loadPosts());
  }

  Future<void> _onLoadPosts(LoadPostsEvent event, Emitter<PostListBlocState> emit) async {
    emit(const PostListBlocState.loading());

    try {
      final List<Post> posts = await _repository.getPosts(page: 1, limit: _pageSize);

      emit(PostListBlocState.loaded(posts: posts, currentPage: 1, hasMore: posts.length == _pageSize));
    } catch (e) {
      emit(PostListBlocState.error(errorMessage: e.toString()));
    }
  }

  Future<void> _onRefreshPosts(RefreshPostsEvent event, Emitter<PostListBlocState> emit) async {
    _repository.clearCache();
    add(const PostListEvent.loadPosts());
  }

  Future<void> _onLoadMorePosts(LoadMorePostsEvent event, Emitter<PostListBlocState> emit) async {
    final PostListBlocState currentState = state;

    final List<Post>? currentPosts = currentState.maybeMap(
      loaded: (value) => value.posts,
      loadingMore: (value) => value.posts,
      orElse: () => null,
    );

    if (currentPosts == null) {
      return;
    }

    final int? currentPage = currentState.maybeMap(
      loaded: (value) => value.currentPage,
      loadingMore: (value) => value.currentPage,
      orElse: () => null,
    );

    if (currentPage == null) {
      return;
    }

    final bool? hasMore = currentState.maybeMap(
      loaded: (value) => value.hasMore,
      loadingMore: (value) => value.hasMore,
      orElse: () => null,
    );

    if (hasMore == null || !hasMore) {
      return;
    }

    emit(PostListBlocState.loadingMore(posts: currentPosts, currentPage: currentPage, hasMore: hasMore));

    try {
      final int nextPage = currentPage + 1;
      final List<Post> newPosts = await _repository.getPosts(page: nextPage, limit: _pageSize);

      emit(
        PostListBlocState.loaded(
          posts: [...currentPosts, ...newPosts],
          currentPage: nextPage,
          hasMore: newPosts.length == _pageSize,
        ),
      );
    } catch (e) {
      emit(PostListBlocState.error(errorMessage: e.toString(), posts: currentPosts));
    }
  }
}
