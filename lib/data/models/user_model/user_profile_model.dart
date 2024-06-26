class User {
  String? userId;
  String username;
  String email;
  String fullname;
  String accountType;
  List<dynamic> followers;
  List<dynamic> following;
  String bio;
  String profilePicture;
  String coverPhoto;
  String? token;

  User({
    this.userId,
    required this.username,
    required this.email,
    required this.fullname,
    required this.accountType,
    required this.followers,
    required this.following,
    required this.bio,
    required this.profilePicture,
    required this.coverPhoto,
     this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      fullname: json['fullname'],
      accountType: json['account_type'],
      followers: List<dynamic>.from(json['followers']),
      following: List<dynamic>.from(json['following']),
      bio: json['bio'],
      profilePicture: json['profile_picture'],
      coverPhoto: json['cover_photo'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'fullname': fullname,
      'account_type': accountType,
      'followers': followers,
      'following': following,
      'bio': bio,
      'profile_picture': profilePicture,
      'cover_photo': coverPhoto,
      'token': token,
    };
  }
}
