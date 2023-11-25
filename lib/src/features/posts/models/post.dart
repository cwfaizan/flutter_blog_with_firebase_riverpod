import 'package:equatable/equatable.dart';

typedef PostID = String;

class Post extends Equatable {
  final PostID id;
  final String title;
  final String description;

  const Post({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Post.fromMap(Map<String, dynamic> map) => Post(
        id: map['id'] as String,
        title: map['title'] ?? '',
        description: map['description'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
      };

  // this is a function used for update post details
  // in existing instance/object of class
  Post copyWith({PostID? id, String? title, String? description}) => Post(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  @override
  List<Object?> get props => [id, title, description];

  @override
  bool? get stringify => true;
}
