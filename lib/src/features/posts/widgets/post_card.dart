import 'package:flutter/material.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/features/posts/models/post.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/alert_dialogs.dart';
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
                _deletePost(context, ref, post.id);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  void _deletePost(BuildContext context, WidgetRef ref, PostID id) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final delete = await showAlertDialog(
      context: context,
      title: 'Are you sure?'.hardcoded,
      cancelActionText: 'Cancel'.hardcoded,
      defaultActionText: 'Delete'.hardcoded,
    );
    if (delete == true) {
      final success =
          await ref.read(postControllerProvider.notifier).deletePost(id);
      if (success) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              'Post successfully deleted'.hardcoded,
            ),
          ),
        );
      }
    }
  }
}
