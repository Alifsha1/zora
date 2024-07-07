import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:zora/core/utils/api_endpoints.dart';
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
}
