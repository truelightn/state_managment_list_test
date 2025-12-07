import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/post_list_bloc.dart';
import '../blocs/post_list_event.dart';
import '../blocs/post_list_bloc_state.dart';
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
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      final PostListBlocState state = context.read<PostListBloc>().state;

      if (state.hasMore && !state.isLoadingMore) {
        context.read<PostListBloc>().add(const LoadMorePostsEvent());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PostListBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts (Bloc)'),
        ),
        body: BlocBuilder<PostListBloc, PostListBlocState>(
          builder: (BuildContext context, PostListBlocState state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostListBloc>().add(const RefreshPostsEvent());
              },
              child: _buildBody(context, state),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, PostListBlocState state) {
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
              onPressed: () {
                context.read<PostListBloc>().add(const LoadPostsEvent());
              },
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

