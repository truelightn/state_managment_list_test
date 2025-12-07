import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/post_list_annotation_controller.dart';
import '../controllers/post_list_state.dart';
import '../widgets/post_item.dart';

class PostListAnnotationScreen extends ConsumerStatefulWidget {
  const PostListAnnotationScreen({super.key});

  @override
  ConsumerState<PostListAnnotationScreen> createState() =>
      _PostListAnnotationScreenState();
}

class _PostListAnnotationScreenState
    extends ConsumerState<PostListAnnotationScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final PostListState state =
          ref.read(postListAnnotationControllerProvider);
      final PostListAnnotationController controller =
          ref.read(postListAnnotationControllerProvider.notifier);

      if (state.hasMore && !state.isLoadingMore) {
        controller.loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final PostListState state =
        ref.watch(postListAnnotationControllerProvider);
    final PostListAnnotationController controller =
        ref.read(postListAnnotationControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts (Riverpod Annotation)'),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refresh(),
        child: _buildBody(context, state, controller),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    PostListState state,
    PostListAnnotationController controller,
  ) {
    if (state.isLoading && state.posts.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.hasError && state.posts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '오류가 발생했습니다',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              state.errorMessage,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => controller.loadPosts(),
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: state.posts.length + (state.hasMore ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        if (index == state.posts.length) {
          if (state.isLoadingMore) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return const SizedBox.shrink();
        }

        return PostItem(post: state.posts[index]);
      },
    );
  }
}

