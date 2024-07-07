import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_manager/photo_manager.dart';
import 'package:zora/core/utils/api_endpoints.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';
import 'package:zora/domain/repository/cloud_repo/cloud_repo.dart';

class PostRepo {
  static Future<String> createpost(String description,
      List<AssetEntity> selectedAssets, String location) async {
    // log('description: $description');
    var client = http.Client();
    String token = await UserToken.getToken();
    String createpostUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.createPost}";
    try {
      final image = await CloudRepo.postimageupload(selectedAssets);
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      final body = {
        "postData": {
          "description": description,
          "location": location,
          "image": image,
        }
      };
      //  log('body :$body');
      var response = await client.post(Uri.parse(createpostUrl),
          body: jsonEncode(body), headers: headers);
      debugPrint('response of post ${response.body.toString()}');
      debugPrint('response statuscode ${response.statusCode}');
      if (response.statusCode == 201 || response.statusCode == 200) {
        return 'success';
      } else {
        return 'oops';
      }
    } catch (e) {
      log(e.toString());
      return 'error';
    }
  }

  static Future<String> deletepost({required String postid}) async {
    var client = http.Client();
    String token = await UserToken.getToken();
    String deleteposturl =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.deletepost}$postid";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response =
          await client.delete(Uri.parse(deleteposturl), headers: headers);
      debugPrint('response of delete ${response.statusCode}');
      if (response.statusCode == 201) {
        return 'success';
      } else {
        return 'oops';
      }
    } catch (e) {
      log(e.toString());
      return 'error';
    }
  }

  // static Future<String> fetchpost() async {
  //   var client = http.Client();
  //   String token = await UserToken.getToken();
  // }
}
