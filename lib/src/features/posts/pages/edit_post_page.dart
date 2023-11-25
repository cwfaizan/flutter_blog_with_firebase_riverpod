import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post.dart';
import '../repositories/post_repository.dart';
import 'edit_post_page_content.dart';

class EditPostPage extends ConsumerWidget {
  const EditPostPage({super.key, required this.id});
  final PostID id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamPost = ref.watch(streamPostProvider(id));
    return streamPost.when(
      data: (post) => post != null
          ? EditPostPageContent(
              post: post,
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text('Edit Post'),
              ),
              body: const Center(
                child: Text('Post not found'),
              ),
            ),
      error: (error, trace) => Text(
        error.toString(),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
