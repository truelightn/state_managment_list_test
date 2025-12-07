import 'package:get/get.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';
import '../services/api_service.dart';
import 'post_list_state.dart';

class PostListGetxController extends GetxController {
  final ApiService _apiService = ApiService();
  late final PostRepository _repository;
  static const int _pageSize = 10;

  final Rx<PostListState> _state = const PostListState().obs;
  PostListState get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    _repository = PostRepository(_apiService);
    loadPosts();
  }

  Future<void> loadPosts() async {
    _state.value = _state.value.copyWith(
      isLoading: true,
      hasError: false,
      errorMessage: '',
      currentPage: 1,
    );

    try {
      final List<Post> posts = await _repository.getPosts(
        page: 1,
        limit: _pageSize,
      );

      _state.value = _state.value.copyWith(
        posts: posts,
        isLoading: false,
        currentPage: 1,
        hasMore: posts.length == _pageSize,
      );
    } catch (e) {
      _state.value = _state.value.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    _repository.clearCache();
    await loadPosts();
  }

  Future<void> loadMore() async {
    if (_state.value.isLoadingMore || !_state.value.hasMore) {
      return;
    }

    _state.value = _state.value.copyWith(isLoadingMore: true);

    try {
      final int nextPage = _state.value.currentPage + 1;
      final List<Post> newPosts = await _repository.getPosts(
        page: nextPage,
        limit: _pageSize,
      );

      _state.value = _state.value.copyWith(
        posts: [..._state.value.posts, ...newPosts],
        isLoadingMore: false,
        currentPage: nextPage,
        hasMore: newPosts.length == _pageSize,
      );
    } catch (e) {
      _state.value = _state.value.copyWith(
        isLoadingMore: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }
}

