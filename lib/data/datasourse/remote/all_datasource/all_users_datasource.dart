import 'dart:convert';
import 'dart:developer';

import 'package:zora/core/utils/api_endpoints.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:zora/data/service/shared_preferences/shared_preference.dart';

class AllUsersDatasource {
    static var client = http.Client();
  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> users = [];
    String token = await UserToken.getToken();
    String alluserurl = "${ApiEndPoints.baseUrl}${ApiEndPoints.allusers}";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await client.get(Uri.parse(alluserurl), headers: headers);
      if (response.statusCode == 200) {
        log('get all users code${response.statusCode}');
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        // log(responseData['user'].toString());
        // UserModel user = UserModel.fromJson(responseData);
        // return GetAllUserModel(user: user);
        final List decodeData = responseData['user'];
        // // log(response.body);
        return decodeData.map((post) => UserModel.fromJson(post)).toList();
      }
      return users;
    } catch (e) {
      log(e.toString());
      log('its not working get users');
      return users;
    }
  }

   Future<List<UserModel>> search(String username) async {
    List<UserModel> users = [];
    String token = await UserToken.getToken();
    String serachurl =
        "${ApiEndPoints.baseUrl}${ApiEndPoints.search}?query=$username";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      var response = await client.get(Uri.parse(serachurl), headers: headers);
      if (response.statusCode == 200) {
        log('get all users code${response.statusCode}');
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        log('$responseData');
        final List decodeData = responseData['users'];

        return decodeData.map((post) => UserModel.fromJson(post)).toList();
      }
      return users;
    } catch (e) {
      log(e.toString());
      log('its not working get users');
      return users;
    }
  }
}