import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/post_controller.dart';

class AddPostPage extends ConsumerWidget {
  AddPostPage({super.key});

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
              title: const Text('Add Post'),
            ),
            body: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Title'),
                    TextFormField(
                      controller: titleController,
                      validator: (value) {
                        if (value == null) return 'title required';
                        if (value.isEmpty) return 'title required';
                        return null;
                      },
                    ),
                    const Text('Description'),
                    TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null) return 'des required';
                        if (value.isEmpty) return 'des required';
                        return null;
                      },
                    ),
                    FilledButton(
                      onPressed: () {
                        savePost(ref);
                      },
                      child: const Text('Save'),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Future<void> savePost(WidgetRef ref) async {
    if (!formKey.currentState!.validate()) {
      // show errors msg to user
      // data is not correct
      return;
    }
    final success = await ref.read(postControllerProvider.notifier).savePost(
          titleController.text,
          descriptionController.text,
        );
    // show success msg to user, don't show msg on console
    if (success) {
      log('Object: Post successfully saved');
    }
  }
}
