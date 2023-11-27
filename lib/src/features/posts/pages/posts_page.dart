import 'package:flutter/material.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/common_widgets/async_value_ui.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/features/posts/repositories/post_repository.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/features/posts/widgets/post_card.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/routing/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/empty_placeholder.dart';
import '../controllers/post_controller.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this listener is used to show alert dialog on error, while post is deleting
    ref.listen<AsyncValue>(
      postControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    // this provider is used to provide live list of posts from firebase
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
            ? EmptyPlaceholder(
                message: 'No Posts'.hardcoded,
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
