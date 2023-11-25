import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/features/posts/models/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/app_router.dart';
import '../controllers/post_controller.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post, required this.ref});
  final Post post;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                context.goNamed(
                  AppRoute.postEdit.name,
                  pathParameters: {'id': post.id},
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                deletePost(ref, post.id);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  void deletePost(WidgetRef ref, PostID id) async {
    final success =
        await ref.read(postControllerProvider.notifier).deletePost(id);
    // show success msg to user, don't show msg on console
    if (success) {
      log('Object: Post successfully deleted');
    }
  }
}
