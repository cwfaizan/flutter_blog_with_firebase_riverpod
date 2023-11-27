import 'package:flutter/material.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/common_widgets/empty_placeholder.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post.dart';
import '../repositories/post_repository.dart';
import 'edit_post_page_content.dart';

class EditPostPage extends ConsumerWidget {
  const EditPostPage({super.key, required this.id});
  final PostID id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this controller is used to get & show live post data
    final streamPost = ref.watch(streamPostProvider(id));
    return streamPost.when(
      data: (post) => post != null
          ? EditPostPageContent(
              post: post,
            )
          : Scaffold(
              appBar: AppBar(
                title: Text('Edit Post'.hardcoded),
              ),
              body: EmptyPlaceholder(
                message: 'Post not found'.hardcoded,
              ),
            ),
      error: (error, trace) => Text(
        error.toString(),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
