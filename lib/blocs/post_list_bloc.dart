import 'package:flutter_bloc/flutter_bloc.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';
import '../services/api_service.dart';
import 'post_list_event.dart';
import 'post_list_bloc_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListBlocState> {
  final PostRepository _repository;
  static const int _pageSize = 10;

  PostListBloc({
    PostRepository? repository,
  })  : _repository = repository ?? PostRepository(ApiService()),
        super(const PostListBlocState()) {
    on<LoadPostsEvent>(_onLoadPosts);
    on<RefreshPostsEvent>(_onRefreshPosts);
    on<LoadMorePostsEvent>(_onLoadMorePosts);
    add(const LoadPostsEvent());
  }

  Future<void> _onLoadPosts(
    LoadPostsEvent event,
    Emitter<PostListBlocState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      errorMessage: '',
      currentPage: 1,
    ));

    try {
      final List<Post> posts = await _repository.getPosts(
        page: 1,
        limit: _pageSize,
      );

      emit(state.copyWith(
        posts: posts,
        isLoading: false,
        currentPage: 1,
        hasMore: posts.length == _pageSize,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onRefreshPosts(
    RefreshPostsEvent event,
    Emitter<PostListBlocState> emit,
  ) async {
    _repository.clearCache();
    add(const LoadPostsEvent());
  }

  Future<void> _onLoadMorePosts(
    LoadMorePostsEvent event,
    Emitter<PostListBlocState> emit,
  ) async {
    if (state.isLoadingMore || !state.hasMore) {
      return;
    }

    emit(state.copyWith(isLoadingMore: true));

    try {
      final int nextPage = state.currentPage + 1;
      final List<Post> newPosts = await _repository.getPosts(
        page: nextPage,
        limit: _pageSize,
      );

      emit(state.copyWith(
        posts: [...state.posts, ...newPosts],
        isLoadingMore: false,
        currentPage: nextPage,
        hasMore: newPosts.length == _pageSize,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingMore: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }
}

