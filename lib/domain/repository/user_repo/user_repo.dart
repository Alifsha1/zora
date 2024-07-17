import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zora/core/utils/api_endpoints.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';

class UserRepo {
  static var client = http.Client();

  //Fetch loggedIn user details
  static Future fetchLoggedInuseerDetails() async {
    try {
      final token = await UserToken.getToken();
      var response = await client.get(
          Uri.parse('${ApiEndPoints.baseUrl}${ApiEndPoints.profile}'),
          headers: {'Authorization': 'Bearer $token'});
      // log('user repo :${response.body.toString()}');
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<UserModelDetails?> getuserdetails(String userid) async {
    String token = await UserToken.getToken();
    String getuserurl =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.getusersformid}$userid";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var response = await client.get(Uri.parse(getuserurl), headers: headers);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var userData = responseData['user'];
        final currentUserposts = responseData['posts'];
        final user = UserModel.fromJson(userData);

        final List<PostModel> posts = [];
        for (var element in currentUserposts) {
          posts.add(PostModel.fromJson(element));
        }
        return UserModelDetails(userModel: user, postmodel: posts);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> followuser(String userid) async {
    String token = await UserToken.getToken();
    String followurl =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.followuser}$userid";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await client.patch(Uri.parse(followurl), headers: headers);
      if (response.statusCode == 200) {
        log('ISfollowed success: ${response.body}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> unfollowuser(String userid) async {
    String token = await UserToken.getToken();
    String followurl =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.unfollowuser}$userid";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await client.patch(Uri.parse(followurl), headers: headers);
      if (response.statusCode == 200) {
         log('ISUnfollowed success: ${response.body}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
  
}

class UserModelDetails {
  final UserModel userModel;
  final List<PostModel> postmodel;
  UserModelDetails({
    required this.userModel,
    required this.postmodel,
  });
}
