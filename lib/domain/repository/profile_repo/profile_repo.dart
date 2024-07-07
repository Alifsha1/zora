import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zora/core/utils/api_endpoints.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';
import 'package:zora/domain/repository/cloud_repo/cloud_repo.dart';

class ProfileRepo {
  static Future<ProfileDetailsModel?> fetchUserDetails() async {
    var client = http.Client();
    String token = await UserToken.getToken();
    String userDetailsUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.profile}";
    try {
      var response = await client.get(Uri.parse(userDetailsUrl), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      debugPrint('fetch Users Status: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        UserModel user = UserModel.fromJson(responseData['user']);
        return ProfileDetailsModel(user: user);
      }
      return null;
    } catch (e) {
      debugPrint('fetch user error : ${e.toString()}');
      return null;
    }
  }

  // static Future<String> updateUserDetails(UserModel initialUser,
  //     UserModel updatedUser, String updateProfilePicture,String updateCoverPicture) async {
  //   var client = http.Client();
  //   String token = await UserToken.getToken();
  //   String updateUserDetailsurl =
  //       "${ApiEndPoints.baseUrl}${ApiEndPoints.editprofile}";
  //   try {
  //     Map<String, dynamic> updatedfield = {};
  //     if (updatedUser.fullName != initialUser.fullName) {
  //       updatedfield['fullname'] = updatedUser.fullName;
  //     }
  //     if (updatedUser.username != initialUser.username) {
  //       updatedfield['username'] = updatedUser.username;
  //     }
  //     if (updatedUser.bio != initialUser.bio) {
  //       updatedfield['bio'] = updatedUser.bio;
  //     }
  //     if (updateProfilePicture != initialUser.profilePicture) {
  //       updatedfield['profile_picture'] = updateProfilePicture;
  //     }
  //      if (updateCoverPicture != initialUser.coverPic) {
  //       updatedfield['cover_photo'] = updateCoverPicture;
  //     }

  //     var response = await client.patch(Uri.parse(updateUserDetailsurl),
  //         body: jsonEncode(updatedfield),
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': 'Bearer $token',
  //         });
  //     debugPrint('update user status: ${response.statusCode}');
  //     if (response.statusCode == 201) {
  //       return 'success';
  //     }
  //     if (response.statusCode == 404) {
  //       return 'username-exists';
  //     }
  //     return '';
  //   } catch (e) {
  //     debugPrint('Update User Error: $e');
  //     return '';
  //   }
  // }
  static updateUserDetails(String username, String fullname, String? bio, profilePic,
      coverpic) async {
    var client = http.Client();
    final dynamic profilePicUrl;
    final dynamic coverPicUrl;

    if (profilePic is! String) {
      profilePicUrl = await CloudRepo.uploadImage(profilePic);
    } else {
      profilePicUrl = profilePic;
    }
    if (coverpic is! String) {
      coverPicUrl = await CloudRepo.uploadImage(coverpic);
    } else {
      coverPicUrl = coverpic;
    }

    debugPrint("coverpic url = $coverPicUrl");
    debugPrint("profilePic url = $profilePicUrl");

    String url = "${ApiEndPoints.baseUrl}${ApiEndPoints.editprofile}";
    final body = {
      "fullname": fullname,
      "bio": bio,
      "profile_picture": profilePicUrl,
      "cover_photo": coverPicUrl
    };
    final encodedbody = jsonEncode(body);
    final token = await UserToken.getToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await client.patch(Uri.parse(url),
          body: encodedbody, headers: headers);
      debugPrint("response statuscode = ${response.statusCode}");
      debugPrint("response body = ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}

class ProfileDetailsModel {
  final UserModel user;

  ProfileDetailsModel({
    required this.user,
  });
}
