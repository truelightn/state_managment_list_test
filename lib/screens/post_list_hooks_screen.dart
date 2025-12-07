import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/post_list_hooks_controller.dart';
import '../controllers/post_list_state.dart';
import '../widgets/post_item.dart';

class PostListHooksScreen extends HookConsumerWidget {
  const PostListHooksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();

    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent * 0.9) {
          final PostListState state =
              ref.read(postListHooksControllerProvider);
          final PostListHooksController controller =
              ref.read(postListHooksControllerProvider.notifier);

          if (state.hasMore && !state.isLoadingMore) {
            controller.loadMore();
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    final PostListState state = ref.watch(postListHooksControllerProvider);
    final PostListHooksController controller =
        ref.read(postListHooksControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts (Riverpod Annotation + Hooks)'),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refresh(),
        child: _buildBody(context, state, controller, scrollController),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    PostListState state,
    PostListHooksController controller,
    ScrollController scrollController,
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
      controller: scrollController,
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

