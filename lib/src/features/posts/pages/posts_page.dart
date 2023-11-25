import 'package:flutter/material.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/features/posts/repositories/post_repository.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/features/posts/widgets/post_card.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamPostsList = ref.watch(streamPostsListProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          // add new post
          IconButton(
            onPressed: () {
              context.goNamed(AppRoute.postAdd.name);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: streamPostsList.when(
        data: (postsList) => postsList.isEmpty
            ? const Center(
                child: Text('No Posts'),
              )
            : ListView.builder(
                itemCount: postsList.length,
                // note: always create card in a separate widget file
                itemBuilder: (ctx, index) => PostCard(
                  post: postsList[index],
                  ref: ref,
                ),
              ),
        error: (error, trace) => Text(
          error.toString(),
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
