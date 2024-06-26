import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/pages/sign_up/signup_page.dart';
import 'package:zora/presentaion/pages/user_login/user_login_widget.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [MainHeading(heading: 'Log in')],
            ),
            SizedBox(
              height: mediaheight * .14,
            ),
            UserLoginWidget(formKey: formKey, usernameController: usernameController, passwordController: passwordController, mediawidth: mediawidth),
            SizedBox(
              height: mediaheight * .37,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have an account?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 127, 162, 194),
                      fontWeight: FontWeight.normal,
                      fontFamily: "Quick_sand"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()));
                  },
                  child: const Text(
                    'Signup',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Quick_sand"),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}


