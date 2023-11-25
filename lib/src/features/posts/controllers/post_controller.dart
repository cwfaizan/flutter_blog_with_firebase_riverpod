import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../routing/app_router.dart';
import '../models/post.dart';
import '../repositories/post_repository.dart';

part 'post_controller.g.dart';

@riverpod
class PostController extends _$PostController {
  @override
  FutureOr<void> build() {}

  Future<bool> savePost(String title, String description) async {
    state = const AsyncValue.loading();
    // this is temp logic to create id of Post
    PostID id = DateTime.now().microsecondsSinceEpoch.toString();
    final post = Post(id: id, title: title, description: description);
    final postRepository = ref.read(postRepositoryProvider);
    state = await AsyncValue.guard(() => postRepository.savePost(post));
    final success = state.hasError == false;
    if (success) {
      // goto back screen
      // ignore: avoid_manual_providers_as_generated_provider_dependency
      ref.read(goRouterProvider).pop();
    }
    return success;
  }

  Future<bool> updatePost(Post post, String title, String description) async {
    state = const AsyncValue.loading();
    // Update post metadata (keep the old id)
    final updatedPost = post.copyWith(
      title: title,
      description: description,
    );
    final postRepository = ref.read(postRepositoryProvider);
    state =
        await AsyncValue.guard(() => postRepository.updatePost(updatedPost));
    final success = state.hasError == false;
    if (success) {
      // goto back screen
      // ignore: avoid_manual_providers_as_generated_provider_dependency
      ref.read(goRouterProvider).pop();
    }
    return success;
  }

  Future<bool> deletePost(PostID id) async {
    state = const AsyncLoading();
    final postRepository = ref.read(postRepositoryProvider);
    state = await AsyncValue.guard(() => postRepository.deletePost(id));
    return state.hasError;
  }
}
