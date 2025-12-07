import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/post_list_provider_controller.dart';
import '../controllers/post_list_state.dart';
import '../widgets/post_item.dart';

class PostListProviderScreen extends StatefulWidget {
  const PostListProviderScreen({super.key});

  @override
  State<PostListProviderScreen> createState() => _PostListProviderScreenState();
}

class _PostListProviderScreenState extends State<PostListProviderScreen> {
  final ScrollController _scrollController = ScrollController();
  VoidCallback? _scrollListener;

  @override
  void dispose() {
    if (_scrollListener != null) {
      _scrollController.removeListener(_scrollListener!);
    }
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll(BuildContext context) {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final PostListProviderController controller =
          context.read<PostListProviderController>();
      final PostListState state = controller.state;

      if (state.hasMore && !state.isLoadingMore) {
        controller.loadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PostListProviderController(),
      child: Builder(
        builder: (BuildContext context) {
          if (_scrollListener == null) {
            _scrollListener = () => _onScroll(context);
            _scrollController.addListener(_scrollListener!);
          }
          return Scaffold(
            appBar: AppBar(title: const Text('Posts (Provider)')),
            body: Consumer<PostListProviderController>(
              builder: (BuildContext context, PostListProviderController controller, Widget? child) {
                return RefreshIndicator(onRefresh: () => controller.refresh(), child: _buildBody(context, controller));
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    PostListProviderController controller,
  ) {
    if (controller.state.isLoading && controller.state.posts.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (controller.state.hasError && controller.state.posts.isEmpty) {
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
              controller.state.errorMessage,
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
      itemCount: controller.state.posts.length + (controller.state.hasMore ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        if (index == controller.state.posts.length) {
          if (controller.state.isLoadingMore) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return const SizedBox.shrink();
        }

        return PostItem(post: controller.state.posts[index]);
      },
    );
  }
}

