import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
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
      backgroundColor: const Color.fromARGB(255, 244, 255, 255),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Maintitle(
                heading: 'Zora...!',
              ),
            ],
          ),
          NormalBondTitles(
            titles: 'Connect, explore, and \n   express yourself☀️',
            color: const Color.fromARGB(255, 119, 118, 118),
          ),
          LottieBuilder.asset(
            'assets/lottie/Animation - 1720267696953.json',
            width: 400,
            height: 400,
            // onLoaded: (p0) async {
            //   await Future.delayed(const Duration(milliseconds: 1000));
            // },
          ),
        ],
      )),
    );
    // return AnimatedSplashScreen(
    //   splash: Column(
    //     children: [
    //       Center(
    //         child: LottieBuilder.asset(
    //             'assets/lottie/Animation - 1720267696953.json'),
    //       ),
    //     ],
    //   ),
    //   nextScreen: SizedBox(),
    // );
  }

  Future<void> checkUserStatus() async {
    final userSignIn = await UserAuthStatus.getUserStatus();
    if (userSignIn == false) {
      await Future.delayed(const Duration(milliseconds: 1200));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const UserLogin()),
          (route) => false);
    } else {
      await Future.delayed(const Duration(milliseconds: 700));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const CustomNavBar()),
          (route) => false);
    }
  }
}
