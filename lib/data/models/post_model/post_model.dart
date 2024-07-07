class PostModel {
  String? id;
  String? userId;
  String? description;
  List? mediaURL;
  List? likes;
  List<dynamic>? comments;
  String? location;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  int? v;

  PostModel({
    this.id,
    this.userId,
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
      userId: json['userId'],
      description: json['description'],
      mediaURL: json['mediaURL'],
      likes: json['likes'],
      comments: List<dynamic>.from(json['comments']),
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
      'userId': userId,
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

