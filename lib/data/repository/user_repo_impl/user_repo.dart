import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zora/core/utils/api_endpoints.dart';
import 'package:zora/data/datasourse/remote/user_datasource/user_darasource.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';
import 'package:zora/domain/repo/user_repo/user.dart';

class UserRepoImpl implements UserRepo {
  final UserDatasource datasource;
  UserRepoImpl({required this.datasource});

  static var client = http.Client();

  //Fetch loggedIn user details
  @override
  Future fetchLoggedInuseerDetails() async {
    return await datasource.fetchLoggedInuseerDetails();
  }

  @override
  Future<UserModelDetails?> getuserdetails(String userid) async {
    return await datasource.getuserdetails(userid);
  }

  @override
  Future<bool> followuser(String userid) async {
    return await datasource.followuser(userid);
  }

  @override
  Future<bool> unfollowuser(String userid) async {
    return await datasource.unfollowuser(userid);
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
