import 'package:flutter/material.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/pages/nav_bar/nav_bar.dart';
import 'package:zora/presentaion/pages/user_login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 255, 255),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainHeading(heading: 'Zora...'),
            ],
          ),
        ],
      )),
    );
  }

  Future<void> checkUserStatus() async {
    final userSignIn = await UserAuthStatus.getUserStatus();
    if (userSignIn == false) {
      await Future.delayed(Duration(milliseconds: 700));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => UserLogin()),
          (route) => false);
    } else {
      await Future.delayed(Duration(milliseconds: 700));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CustomNavBar()),
          (route) => false);
    }
  }
}
