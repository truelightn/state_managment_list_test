import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  List<Map<String, dynamic>>? _cachedPosts;

  Future<List<Map<String, dynamic>>> fetchPosts({
    required int page,
    required int limit,
  }) async {
    if (_cachedPosts == null) {
      final Uri uri = Uri.parse('$baseUrl/posts');
      final http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList =
            json.decode(response.body) as List<dynamic>;
        _cachedPosts = jsonList.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    }

    final int startIndex = (page - 1) * limit;
    final int endIndex = startIndex + limit;

    if (startIndex >= _cachedPosts!.length) {
      return [];
    }

    return _cachedPosts!.sublist(
      startIndex,
      endIndex > _cachedPosts!.length ? _cachedPosts!.length : endIndex,
    );
  }

  void clearCache() {
    _cachedPosts = null;
  }
}

