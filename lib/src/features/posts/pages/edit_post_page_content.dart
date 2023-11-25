import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/post_controller.dart';
import '../models/post.dart';

class EditPostPageContent extends ConsumerWidget {
  EditPostPageContent({
    super.key,
    required this.post,
  });
  final Post post;
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postController = ref.watch(postControllerProvider);
    return postController.isLoading
        ? const CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Edit Post'),
            ),
            body: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Title'),
                    TextFormField(
                      controller: titleController..text = post.title,
                      validator: (value) {
                        if (value == null) return 'title required';
                        if (value.isEmpty) return 'title required';
                        return null;
                      },
                    ),
                    const Text('Description'),
                    TextFormField(
                      controller: descriptionController
                        ..text = post.description,
                      validator: (value) {
                        if (value == null) return 'des required';
                        if (value.isEmpty) return 'des required';
                        return null;
                      },
                    ),
                    FilledButton(
                      onPressed: () {
                        updatePost(ref);
                      },
                      child: const Text('Update Post'),
                    )
                  ],
                ),
              ),
            ));
  }

  Future<void> updatePost(WidgetRef ref) async {
    if (!formKey.currentState!.validate()) {
      // show errors msg to user
      // data is not correct
      return;
    }
    final success = await ref.read(postControllerProvider.notifier).updatePost(
          post,
          titleController.text,
          descriptionController.text,
        );
    // show success msg to user, don't show msg on console
    if (success) {
      log('Object: Post successfully updated');
    }
  }
}
