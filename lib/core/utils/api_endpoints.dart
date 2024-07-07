import 'package:flutter/material.dart';

class ApiEndPoints {
  static String baseUrl = 'http://10.0.2.2:5000';
  static String userSignUp = '/signup';
  static String userVerifyOyp = '/signup-send-otp';
  static String userlogin = '/login';
  static String profile = '/me';
  static String forgetsendOtp = '/forget-send-otp';
  static String forgetpassword = '/forget-password';
  static String editprofile = '/profile/edit';
  static String createPost = '/createpost';
  static String deletepost = '/post/';
}
