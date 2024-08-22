import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:photo_manager/photo_manager.dart';
import 'package:zora/core/utils/api_endpoints.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';
import 'package:zora/data/repository/cloud_repo_impl/cloud_repo.dart';

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
      }
      if (response.statusCode == 400) {
        return 'parameters-missing';
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

  static Future<List<PostModel>> fetchpost() async {
    List<PostModel> list = [];
    var client = http.Client();
    String token = await UserToken.getToken();
    String fectposturl = "${ApiEndPoints.baseUrl}${ApiEndPoints.fetchpost}";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await client.get(Uri.parse(fectposturl), headers: headers);
      if (response.statusCode == 200) {
        final List decodeData = jsonDecode(response.body);
        // log(response.body);
        return decodeData.map((post) => PostModel.fromJson(post)).toList();
      }
      return list;
    } catch (e) {
      log(e.toString());
      debugPrint('Fetch post error : ${e.toString()}');
      return list;
    }
  }

  static Future likepost({required String postid}) async {
    var client = http.Client();
    String token = await UserToken.getToken();
    String likeurl = "${ApiEndPoints.baseUrl}${ApiEndPoints.likepost}$postid";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await client.patch(Uri.parse(likeurl), headers: headers);
      debugPrint('response of like: ${response.statusCode}');
      if (response.statusCode == 201) {
        return 'success';
      } else if (response.statusCode == 401) {
        return "User Already liked the post";
      } else {
        return "No Post found on this ID";
      }
    } catch (e) {
      log(e.toString());
      return 'error';
    }
  }

  static Future unlikepost({required String postid}) async {
    var client = http.Client();
    String token = await UserToken.getToken();
    String unlikeurl =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.unlikepost}$postid";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await client.patch(Uri.parse(unlikeurl), headers: headers);
      debugPrint('response of unlike: ${response.statusCode}');
      if (response.statusCode == 200) {
        return 'success';
      } else if (response.statusCode == 401) {
        return "User has not liked the post";
      } else {
        return "No Post found on this ID";
      }
    } catch (e) {
      log(e.toString());
      return 'error';
    }
  }

  static Future<CommentModel?> addcomment(String comment, String postid) async {
    var client = http.Client();
    String addcommenturl = "${ApiEndPoints.baseUrl}${ApiEndPoints.addcomment}";
    String token = await UserToken.getToken();
    try {
      final headers = {'Authorization': 'Bearer $token'};
      final body = {'postId': postid, 'comment': comment};
      var response = await client.post(
        Uri.parse(addcommenturl),
        headers: headers,
        body: body,
      );
      // var jsonResponse = jsonDecode(response.body);
      log(response.body);
      if (response.statusCode == 200) {
        var jsonrespone = jsonDecode(response.body);
        CommentModel commentModel = CommentModel.fromJson(jsonrespone['data']);
        return commentModel;
      }
      return null;
    } catch (e) {
      log(e.toString());
      debugPrint('Add comment Error :$e');
      return null;
    }
  }

  static Future<String> deletecomment(
    String postid,
    String commentid,
  ) async {
    var client = http.Client();
    String token = await UserToken.getToken();
    String deletecomment =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.deletecomment}";
    try {
      final headers = {'Authorization': 'Bearer $token'};
      final body = {"postId": postid, "commentId": commentid};
      var response = await client.post(
        Uri.parse(deletecomment),
        headers: headers,
        body: body,
      );
      log(response.body);
      if (response.statusCode == 200) {
        return 'success';
      } else {
        return 'Comment not found';
      }
    } catch (e) {
      log(e.toString());
      debugPrint('delete comment Error :$e');
      return 'error';
    }
  }

  static Future<String> savepost(String? postid) async {
    var client = http.Client();
    String token = await UserToken.getToken();
    String saveposturl =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.savepost}$postid";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var response =
          await client.post(Uri.parse(saveposturl), headers: headers);
      if (response.statusCode == 200) {
        return 'success';
      }
      return '';
    } catch (e) {
      log(e.toString());
      return '';
    }
  }

  static Future<String> unsavepost(String? postid) async {
    var client = http.Client();
    String token = await UserToken.getToken();
    String unsaveposturl =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.unsavepost}$postid";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var response =
          await client.patch(Uri.parse(unsaveposturl), headers: headers);
      if (response.statusCode == 200) {
        return 'success';
      }
      return '';
    } catch (e) {
      log(e.toString());
      return '';
    }
  }

  static Future<List<PostModel?>> savedposts() async {
    List<PostModel> savedPosts = [];
    var client = http.Client();
    String savedurl = "${ApiEndPoints.baseUrl}${ApiEndPoints.savedpost}";
    String token = await UserToken.getToken();
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await client.get(Uri.parse(savedurl), headers: headers);
      log("saved post status code ${response.statusCode}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responsebody = jsonDecode(response.body);
        if (responsebody['saved-posts'] != null) {
          var responseData = responsebody['saved-posts']['posts'];
          List savedpostlist = responseData;
          for (int i = 0; i < savedpostlist.length; i++) {
            PostModel savedpost = PostModel.fromJson(savedpostlist[i]);
            savedPosts.add(savedpost);
          }
          return savedPosts;
        }
      }
      return [];
    } catch (e) {
      log(e.toString());
      debugPrint('Fetch savedpost error : ${e.toString()}');
      return [];
    }
  }
}
