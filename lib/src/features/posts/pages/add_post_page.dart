import 'package:flutter/material.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/common_widgets/async_value_ui.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/post_controller.dart';
import '../widgets/post_validator.dart';

class AddPostPage extends ConsumerWidget {
  AddPostPage({super.key});

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this listener is used to show alert dialog on error, while post is creating
    ref.listen<AsyncValue>(
      postControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    // this controller is used to check loader state, while post is creating
    final postController = ref.watch(postControllerProvider);
    final isLoading = postController.isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'.hardcoded),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                enabled: !isLoading,
                controller: titleController,
                validator: (value) =>
                    ref.read(postValidatorProvider).titleValidator(value),
                decoration: InputDecoration(
                  label: Text('Title'.hardcoded),
                ),
              ),
              TextFormField(
                enabled: !isLoading,
                controller: descriptionController,
                validator: (value) =>
                    ref.read(postValidatorProvider).descriptionValidator(value),
                decoration: InputDecoration(
                  label: Text('Description'.hardcoded),
                ),
              ),
              FilledButton(
                onPressed: () {
                  _savePost(context, ref);
                },
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text('Save'.hardcoded),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _savePost(BuildContext context, WidgetRef ref) async {
    if (formKey.currentState!.validate()) {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final success = await ref.read(postControllerProvider.notifier).savePost(
            titleController.text,
            descriptionController.text,
          );
      // show success msg to user, don't show msg on console
      if (success) {
        // Inform the user that the post has been updated
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              'Post successfully created'.hardcoded,
            ),
          ),
        );
      }
    }
  }
}
