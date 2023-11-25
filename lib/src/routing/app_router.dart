import 'package:flutter/material.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/features/posts/pages/edit_post_page.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/features/posts/pages/posts_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/errors/not_found_page.dart';
import '../features/posts/pages/add_post_page.dart';

enum AppRoute {
  home,
  posts,
  postAdd,
  postEdit,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const PostsPage(),
      ),
      GoRoute(
        path: '/posts',
        name: AppRoute.posts.name,
        builder: (context, state) => const PostsPage(),
        routes: [
          GoRoute(
            path: 'add',
            name: AppRoute.postAdd.name,
            pageBuilder: (context, state) => MaterialPage(
              fullscreenDialog: true,
              child: AddPostPage(),
            ),
          ),
          GoRoute(
            path: 'edit/:id',
            name: AppRoute.postEdit.name,
            pageBuilder: (context, state) {
              final postId = state.pathParameters['id']!;
              return MaterialPage(
                fullscreenDialog: true,
                child: EditPostPage(id: postId),
              );
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
});
