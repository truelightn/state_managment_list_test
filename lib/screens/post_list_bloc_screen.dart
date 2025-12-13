import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/post_list_bloc.dart';
import '../blocs/post_list_event.dart';
import '../blocs/post_list_bloc_state.dart';
import '../entities/post.dart';
import '../widgets/post_item.dart';

class PostListBlocScreen extends StatefulWidget {
  const PostListBlocScreen({super.key});

  @override
  State<PostListBlocScreen> createState() => _PostListBlocScreenState();
}

class _PostListBlocScreenState extends State<PostListBlocScreen> {
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
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.9) {
      final PostListBlocState currentState = context.read<PostListBloc>().state;

      final bool hasMore = currentState.maybeMap(
        loaded: (value) => value.hasMore,
        loadingMore: (value) => value.hasMore,
        orElse: () => false,
      );

      final bool isLoadingMore = currentState.maybeWhen(
        loadingMore: (posts, currentPage, hasMore) => true,
        orElse: () => false,
      );

      if (hasMore && !isLoadingMore) {
        context.read<PostListBloc>().add(const PostListEvent.loadMorePosts());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PostListBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Posts (Bloc)')),
        body: BlocBuilder<PostListBloc, PostListBlocState>(
          builder: (BuildContext context, PostListBlocState state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostListBloc>().add(const PostListEvent.refreshPosts());
              },
              child: _buildBody(context, state),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, PostListBlocState state) {
    return state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (List<Post> posts, int currentPage, bool hasMore) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: posts.length + (hasMore ? 1 : 0),
          itemBuilder: (BuildContext context, int index) {
            if (index == posts.length) {
              return const SizedBox.shrink();
            }

            return PostItem(post: posts[index]);
          },
        );
      },
      loadingMore: (List<Post> posts, int currentPage, bool hasMore) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: posts.length + (hasMore ? 1 : 0),
          itemBuilder: (BuildContext context, int index) {
            if (index == posts.length) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            return PostItem(post: posts[index]);
          },
        );
      },
      error: (String errorMessage, List<Post>? posts) {
        if (posts == null || posts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('오류가 발생했습니다', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(errorMessage, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<PostListBloc>().add(const PostListEvent.loadPosts());
                  },
                  child: const Text('다시 시도'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          controller: _scrollController,
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostItem(post: posts[index]);
          },
        );
      },
    );
  }
}
