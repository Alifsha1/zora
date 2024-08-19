import 'package:zora/data/models/post_model/post_model.dart';

class UserEntity {
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

  UserEntity({
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
}
