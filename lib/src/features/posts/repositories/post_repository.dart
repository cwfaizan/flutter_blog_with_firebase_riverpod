import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_blog_with_firebase_riverpod/src/features/posts/models/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';

// this is Post class
// this class will perform CRUD opertion on firestore
class PostRepository {
  // class constructor
  const PostRepository(this._firestore);
  // class variable
  final FirebaseFirestore _firestore;

  // return path of List<Post>
  static String postsPath() => 'posts';
  // return path of single Post
  static String postPath(PostID id) => 'posts/$id';

  // return List<Post> in Future
  Future<List<Post>> futurePostsList() async {
    final ref = _postsRef();
    final snapshot = await ref.get();
    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  // return List<Post> in live data stream
  Stream<List<Post>> streamPostsList() {
    final ref = _postsRef();
    return ref.snapshots().map((snapshot) =>
        snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList());
  }

  // return single post in future
  Future<Post?> futurePost(PostID id) async {
    final ref = _postRef(id);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  // return single post in live stream
  Stream<Post?> streamPost(PostID id) {
    final ref = _postRef(id);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  // create new post
  Future<void> savePost(Post post) {
    return _firestore.doc(postPath(post.id)).set(
      {
        'id': post.id,
        'title': post.title,
        'description': post.description,
      },
      // use merge: true to keep old fields (if any)
      SetOptions(merge: true),
    );
  }

  // update old post
  Future<void> updatePost(Post post) {
    final ref = _postRef(post.id);
    return ref.set(post);
  }

  // delete post
  Future<void> deletePost(PostID id) {
    return _firestore.doc(postPath(id)).delete();
  }

  // helper function for update and get single post
  DocumentReference<Post> _postRef(PostID id) =>
      _firestore.doc(postPath(id)).withConverter(
            fromFirestore: (doc, _) => Post.fromMap(doc.data()!),
            toFirestore: (Post post, options) => post.toMap(),
          );

  // helper function for update and get list of posts
  Query<Post> _postsRef() => _firestore
      .collection(postsPath())
      .withConverter(
        fromFirestore: (doc, _) => Post.fromMap(doc.data()!),
        toFirestore: (Post post, options) => post.toMap(),
      )
      .orderBy('id');

  // * Temporary search implementation.
  // * Note: this is quite inefficient as it pulls the entire Post list
  // * and then filters the data on the client
  // * Todo: Replace this with server side search
  Future<List<Post>> search(String query) async {
    // 1. Get all Posts from Firestore
    final postsList = await futurePostsList();
    // 2. Perform client-side filtering
    return postsList
        .where((post) => post.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

// this is Riverpod provider, named: postRepositoryProvider
// just create instance of PostRepository class
// this instance perform CRUD operation on firestore
@Riverpod(keepAlive: true)
PostRepository postRepository(PostRepositoryRef ref) {
  return PostRepository(FirebaseFirestore.instance);
}

// this is Riverpod provider, named: streamPostsListProvider
// this provider will get list of stream data from postRepository function
// this provider will send list of stream data to screen/page
@riverpod
Stream<List<Post>> streamPostsList(StreamPostsListRef ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  return postRepository.streamPostsList();
}

// this is Riverpod provider, named: futurePostsListProvider
// this provider will get list of future data from postRepository function
// this provider will send list of future data to screen/page
@riverpod
Future<List<Post>> futurePostsList(FuturePostsListRef ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  return postRepository.futurePostsList();
}

// this is Riverpod provider, named: streamPostProvider
// this provider will get list of stream data from postRepository function
// this provider will send list of stream data to screen/page
@riverpod
Stream<Post?> streamPost(StreamPostRef ref, PostID id) {
  final postRepository = ref.watch(postRepositoryProvider);
  return postRepository.streamPost(id);
}

// this is Riverpod provider, named: futurePostProvider
// this provider will get single future data from postRepository function
// this provider will send single future data to screen/page
@riverpod
Future<Post?> futurePost(FuturePostRef ref, PostID id) {
  final postRepository = ref.watch(postRepositoryProvider);
  return postRepository.futurePost(id);
}
