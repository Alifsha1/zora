import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_entity.dart';

class UserModel  {
  final String? id;
  final String? username;
  final String? password;
  final String? email;
  final int? phonenumber;
  final String? accountType;
  final String? profilePicture;
  final String? coverPic;
  final String? bio;
  List<PostModel>? posts;
  final List? followers;
  final List? following;
  final String? fullName;
  final String? otp;

  UserModel({
    this.id,
    this.username,
    this.password,
    this.email,
    this.phonenumber,
    this.accountType,
    this.profilePicture,
    this.coverPic,
    this.bio,
    this.posts,
    this.followers,
    this.following,
    this.fullName,
    this.otp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phonenumber: json['phonenumber'],
      accountType: json['account_type'],
      profilePicture: json['profile_picture'],
      coverPic: json['cover_photo'],
      bio: json['bio'],
      followers: json['followers'],
      following: json['following'],
      fullName: json['fullname'],
      otp: json['otp'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "username": username,
      "password": password,
      "email": email,
      "phonenumber": phonenumber,
      "account_type": accountType,
      "profile_picture": profilePicture,
      "cover_photo": coverPic,
      "bio": bio,
      "posts": posts,
      "followers": followers,
      "following": following,
      "fullname": fullName,
      "otp": otp,
    };
  }
}
