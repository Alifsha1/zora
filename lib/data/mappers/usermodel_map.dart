import 'package:zora/data/models/user_model/user_entity.dart';
import 'package:zora/data/models/user_model/user_model.dart';

class UserModelMap {
  static UserEntity mapToEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      username: model.username,
      password: model.password,
      email: model.email,
      phonenumber: model.phonenumber,
      accountType: model.accountType,
      profilePicture: model.profilePicture,
      coverPic: model.coverPic,
      bio: model.bio,
      posts: model.posts,
      followers: model.followers,
      following: model.following,
      fullName: model.fullName,
      otp: model.otp,
    );
  }

  static UserModel mapToModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      username: entity.username,
      password: entity.password,
      email: entity.email,
      phonenumber: entity.phonenumber,
      accountType: entity.accountType,
      profilePicture: entity.profilePicture,
      coverPic: entity.coverPic,
      bio: entity.bio,
      posts: entity.posts,
      followers: entity.followers,
      following: entity.following,
      fullName: entity.fullName,
      otp: entity.otp,
    );
  }
}
