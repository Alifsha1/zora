import 'package:flutter/material.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/text_form_field.dart';
import 'package:zora/presentaion/Widgets/zora.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MainHeading(heading: 'Admin'),
            ],
          ),
          SizedBox(
            height: mediaheight * .14,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Textformfieldlog(
                   label: Text('Username'),
                  hint: 'User name',
                  controller: usernameController,
                ),
                SizedBox(
                  height: 20,
                ),
                Textformfieldlog(
                   label: Text('password'),
                  hint: 'password',
                  controller: passwordController,
                ),
                SizedBox(
                  height: 30,
                ),
                Buttonelevated(mediawidth: mediawidth, buttontext: 'Log in'),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
