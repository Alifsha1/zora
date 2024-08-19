
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:zora/core/utils/api_endpoints.dart';

class ForgetRepo {
  static Future<String> forgetSendOtp({required String email}) async {
    var client = http.Client();
    String signUpUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.forgetsendOtp}";
    try {
      debugPrint('email: $email');
      var body = {"email": email};
      var response = await client.post(
        Uri.parse(signUpUrl),
        body: body,
      );
      debugPrint('forget password otp status: ${response.body}');
      if (response.statusCode == 200) {
        return 'success';
      }
      if (response.statusCode == 401) {
        return 'user-not-found';
      }
      return 'error';
    } catch (e) {
      debugPrint('forget password otp error: $e');
      return 'error';
    }
  }

  static Future<String> resetPassword(
      {required String email,
      required String otp,
      required String password}) async {
    var client = http.Client();
    String signUpUrl = "${ApiEndPoints.baseUrl}${ApiEndPoints.forgetpassword}";
    try {
      var body = {
        "email": email,
        "otp": otp,
        "password": password,
      };
      var response = await client.post(Uri.parse(signUpUrl), body: body);
      debugPrint('Reset password status: ${response.statusCode}');
      if (response.statusCode == 201) {
        return 'success';
      }
      if (response.statusCode == 400) {
        return 'invalid-otp';
      }
      return 'error';
    } catch (e) {
      debugPrint('Reset Password Error: $e');
      return 'error';
    }
  }
}
