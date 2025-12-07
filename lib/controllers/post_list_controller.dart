import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';
import '../services/api_service.dart';
import 'post_list_state.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final ApiService apiService = ref.watch(apiServiceProvider);
  return PostRepository(apiService);
});

final postListControllerProvider =
    NotifierProvider<PostListController, PostListState>(
  () => PostListController(),
);

class PostListController extends Notifier<PostListState> {
  static const int _pageSize = 10;

  @override
  PostListState build() {
    Future.microtask(() => loadPosts());
    return const PostListState();
  }

  Future<void> loadPosts() async {
    state = state.copyWith(
      isLoading: true,
      hasError: false,
      errorMessage: '',
      currentPage: 1,
    );

    try {
      final PostRepository repository = ref.read(postRepositoryProvider);
      final List<Post> posts = await repository.getPosts(
        page: 1,
        limit: _pageSize,
      );

      state = state.copyWith(
        posts: posts,
        isLoading: false,
        currentPage: 1,
        hasMore: posts.length == _pageSize,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> refresh() async {
    final PostRepository repository = ref.read(postRepositoryProvider);
    repository.clearCache();
    await loadPosts();
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) {
      return;
    }

    state = state.copyWith(isLoadingMore: true);

    try {
      final PostRepository repository = ref.read(postRepositoryProvider);
      final int nextPage = state.currentPage + 1;
      final List<Post> newPosts = await repository.getPosts(
        page: nextPage,
        limit: _pageSize,
      );

      state = state.copyWith(
        posts: [...state.posts, ...newPosts],
        isLoadingMore: false,
        currentPage: nextPage,
        hasMore: newPosts.length == _pageSize,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingMore: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }
}

