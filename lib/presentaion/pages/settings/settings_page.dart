
import 'package:flutter/material.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/pages/user_login/login_page.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
   // final mediaheight = MediaQuery.of(context).size.height;
    final mediawidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Buttonelevated(
                mediawidth: mediawidth,
                buttontext: "log out",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                      //  backgroundColor: Colors.transparent.withOpacity(0.5),
                            title: const Text('Log out'),
                            content:
                                const Text("Are you sure you want \nto log out?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  UserAuthStatus.saveUserStatus(false);
                                  await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const UserLogin()),
                                      (route) => false);
                                },
                                child: const Text('logout'),
                              ),
                            ],
                          ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
