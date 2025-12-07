abstract class PostListEvent {
  const PostListEvent();
}

class LoadPostsEvent extends PostListEvent {
  const LoadPostsEvent();
}

class RefreshPostsEvent extends PostListEvent {
  const RefreshPostsEvent();
}

class LoadMorePostsEvent extends PostListEvent {
  const LoadMorePostsEvent();
}

