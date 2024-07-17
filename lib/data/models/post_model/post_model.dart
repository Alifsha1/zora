import 'package:zora/data/models/user_model/user_model.dart';

class PostModel {
  String? id;
  String? userId;
  final UserModel? user;
  String? description;
  List? mediaURL;
  List? likes;
  List<CommentModel>? comments;
  String? location;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  int? v;

  PostModel({
    this.id,
    this.userId,
    this.user,
    this.description,
    this.mediaURL,
    this.likes,
    this.comments,
    this.location,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  // Convert a Post from a JSON object
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['_id'],
      userId: json['userId'] is String ? json['userId'] : null,
      user: json['userId'] is Map<String, dynamic>
          ? UserModel.fromJson(json['userId'])
          : UserModel(),
      description: json['description'],
      mediaURL: json['mediaURL'],
      likes: List<String>.from(json['likes']),
      comments: List<CommentModel>.from(
          json['comments'].map((comment) => CommentModel.fromJson(comment))),
      location: json['location'],
      isBlocked: json['isBlocked'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  // Convert a Post to a JSON object
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': user is Map<String, dynamic> ? user?.toJson() : userId,
      'description': description,
      'mediaURL': mediaURL,
      'likes': likes,
      'comments': comments,
      'location': location,
      'isBlocked': isBlocked,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class CommentModel {
  final String id;
  final UserModel user;
  final String comments;
  final String createdAt;

  CommentModel({
    this.id = '',
    required this.user,
    required this.comments,
    required this.createdAt,
  });
  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['_id'],
      user: json['userId'] is Map<String, dynamic>
          ? UserModel.fromJson(json['userId'])
          : UserModel(),
      comments: json['comment'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': user.toJson(),
        'comment': comments,
        'createdAt': createdAt
      };
}
