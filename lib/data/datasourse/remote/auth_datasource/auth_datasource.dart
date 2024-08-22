import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zora/core/utils/api_endpoints.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/data/repository/auth_repo_impl/auth_repo.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';

class AuthDatasource{
    static var client = http.Client();

     Future<SignUpResult> userSignUp({required UserModel user}) async {
   
    String signUpUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.userSignUp}";
    try {
      var response = await client.post(
        Uri.parse(signUpUrl),
        body: jsonEncode(user),
        headers: {'Content-Type': 'application/json'},
      );
      var jsonResponse = jsonDecode(response.body);
      debugPrint('User Sign Up Status : ${response.statusCode}');
      debugPrint('User Sign Up Body : ${response.body}');

      if (response.statusCode == 201) {
        return SignUpResult(status: 'success', responseBody: jsonResponse);
      }
      if (response.statusCode == 400) {
        return SignUpResult(status: 'invalid-otp', responseBody: null);
      }
      return SignUpResult(status: 'error', responseBody: null);
    } catch (e) {
      return SignUpResult(status: 'error', responseBody: null);
    }
  }

  Future<String> userVerifyOtp({required String email}) async {
    var client = http.Client();
    String signUpUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.userVerifyOyp}";
    try {
      var body = {"email": email};
      var respones = await client.post(
        Uri.parse(signUpUrl),
        body: body,
      );
      debugPrint('User Verify Otp Status: ${respones.statusCode}');
      debugPrint('User Verify Otp Body:${respones.body}');
      if (respones.statusCode == 200) {
        return 'success';
      }
      if (respones.statusCode == 401) {
        return 'already-exists';
      }
      return 'error';
    } catch (e) {
      debugPrint('User Verify Otp Error: $e');
      return 'error';
    }
  }
  Future<SignInResult> userLogin(
      {required String username, required String password}) async {
    var client = http.Client();
    String loginUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.userlogin}";
    try {
      var body = {
        "username": username,
        "password": password,
      };
      var response = await client.post(
        Uri.parse(loginUrl),
        body: body,
        //  headers: {'Content-Type': 'application/json'},
      );
      debugPrint('user login status code: ${response.statusCode}');
      debugPrint('user login : ${response.body}');
      var jsonresponse = jsonDecode(response.body);
      if (response.statusCode == 201) {
        await UserAuthStatus.saveUserStatus(true);
        await UserToken.saveToken(jsonresponse['token']);
        await CurrentUSerId.saveUserId(jsonresponse['userId']);
        await saveUsername(username);
        return SignInResult(status: 'success', responseBody: jsonresponse);
      }
      if (response.statusCode == 400) {
        return SignInResult(status: 'invalid-username', responseBody: null);
      }
      if (response.statusCode == 401) {
        if (jsonresponse['error'] == "invalid-password") {
          return SignInResult(status: 'error', responseBody: null);
        }
      }
      return SignInResult(status: 'error', responseBody: null);
    } catch (e) {
      debugPrint('User Sign in Status : $e');
      return SignInResult(status: 'error', responseBody: null);
    }
  }
}