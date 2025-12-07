import '../entities/post.dart';
import '../services/api_service.dart';

class PostRepository {
  final ApiService _apiService;

  PostRepository(this._apiService);

  Future<List<Post>> getPosts({
    required int page,
    required int limit,
  }) async {
    final List<Map<String, dynamic>> jsonList = await _apiService.fetchPosts(
      page: page,
      limit: limit,
    );

    return jsonList.map((json) => Post.fromJson(json)).toList();
  }

  void clearCache() {
    _apiService.clearCache();
  }
}

