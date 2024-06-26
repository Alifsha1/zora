class UserModel {
  final String? id;
  final String? username;
  final String? password;
  final String? email;
  final int? phonenumber;
  final String? accountType;
  final String? profilePicture;
  final String? bio;
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
    this.bio,
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
      bio: json['bio'],
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
      "bio": bio,
      "fullname": fullName,
      "otp": otp,
    };
  }
}
