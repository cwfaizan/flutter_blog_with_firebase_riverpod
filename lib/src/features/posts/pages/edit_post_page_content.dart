import 'package:flutter/material.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/common_widgets/async_value_ui.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/post_controller.dart';
import '../models/post.dart';
import '../widgets/post_validator.dart';

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
    // this listener is used to show alert dialog on error, while post is updating
    ref.listen<AsyncValue>(
      postControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    // this controller is used to check loader state, while post is updating
    final postController = ref.watch(postControllerProvider);
    final isLoading = postController.isLoading;
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Post'.hardcoded),
        ),
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  enabled: !isLoading,
                  controller: titleController..text = post.title,
                  validator: (value) =>
                      ref.read(postValidatorProvider).titleValidator(value),
                  decoration: InputDecoration(
                    label: Text('Title'.hardcoded),
                  ),
                ),
                TextFormField(
                  enabled: !isLoading,
                  controller: descriptionController..text = post.description,
                  validator: (value) => ref
                      .read(postValidatorProvider)
                      .descriptionValidator(value),
                  decoration: InputDecoration(
                    label: Text('Description'.hardcoded),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    _updatePost(context, ref);
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text('Update Post'.hardcoded),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> _updatePost(BuildContext context, WidgetRef ref) async {
    if (formKey.currentState!.validate()) {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final success =
          await ref.read(postControllerProvider.notifier).updatePost(
                post,
                titleController.text,
                descriptionController.text,
              );
      // show success msg to user, don't show msg on console
      if (success) {
        // Inform the user that the post has been updated
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              'Post successfully updated'.hardcoded,
            ),
          ),
        );
      }
    }
  }
}
