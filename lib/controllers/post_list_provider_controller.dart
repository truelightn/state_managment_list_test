import 'package:flutter/foundation.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';
import '../services/api_service.dart';
import 'post_list_state.dart';

class PostListProviderController extends ChangeNotifier {
  final PostRepository _repository;
  static const int _pageSize = 10;

  PostListProviderController({
    PostRepository? repository,
  }) : _repository = repository ?? PostRepository(ApiService()) {
    loadPosts();
  }

  PostListState _state = const PostListState();
  PostListState get state => _state;

  Future<void> loadPosts() async {
    _state = _state.copyWith(
      isLoading: true,
      hasError: false,
      errorMessage: '',
      currentPage: 1,
    );
    notifyListeners();

    try {
      final List<Post> posts = await _repository.getPosts(
        page: 1,
        limit: _pageSize,
      );

      _state = _state.copyWith(
        posts: posts,
        isLoading: false,
        currentPage: 1,
        hasMore: posts.length == _pageSize,
      );
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    _repository.clearCache();
    await loadPosts();
  }

  Future<void> loadMore() async {
    if (_state.isLoadingMore || !_state.hasMore) {
      return;
    }

    _state = _state.copyWith(isLoadingMore: true);
    notifyListeners();

    try {
      final int nextPage = _state.currentPage + 1;
      final List<Post> newPosts = await _repository.getPosts(
        page: nextPage,
        limit: _pageSize,
      );

      _state = _state.copyWith(
        posts: [..._state.posts, ...newPosts],
        isLoadingMore: false,
        currentPage: nextPage,
        hasMore: newPosts.length == _pageSize,
      );
      notifyListeners();
    } catch (e) {
      _state = _state.copyWith(
        isLoadingMore: false,
        hasError: true,
        errorMessage: e.toString(),
      );
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

