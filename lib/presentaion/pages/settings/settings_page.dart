import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/service/shared_preferences/shared_preference.dart';
import 'package:zora/data/service/socket/socket_io.dart';
import 'package:zora/presentaion/Widgets/elevated_button.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/pages/settings/sub_pages/about_us.dart';
import 'package:zora/presentaion/pages/settings/sub_pages/help.dart';
import 'package:zora/presentaion/pages/settings/sub_pages/privacy_policy.dart';
import 'package:zora/presentaion/pages/settings/widgets/socials_icons.dart';
import 'package:zora/presentaion/pages/user_login/login_page.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaheight = MediaQuery.of(context).size.height;
    final mediawidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: NormalBondTitles(titles: 'Settings'),
          backgroundColor: maincolor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomSettingButton(
                mediaheight: mediawidth,
                onPressed: () {
                  navigatorPush(AboutUsPage(), context);
                },
                mediawidth: mediawidth,
                buttontext: 'About Us',
                prefixicon: CupertinoIcons.info,
              ),
              CustomSettingButton(
                mediaheight: mediawidth,
                onPressed: () {
                  navigatorPush(PrivacyAndPolicy(), context);
                },
                mediawidth: mediawidth,
                buttontext: 'Privacy & policy',
                prefixicon: CupertinoIcons.doc,
              ),
              CustomSettingButton(
                mediaheight: mediawidth,
                onPressed: () {
                    navigatorPush(HelpScreen(), context);
                },
                mediawidth: mediawidth,
                buttontext: 'Help',
                prefixicon: CupertinoIcons.question_circle,
              ),
              CustomSettingButton(
                mediaheight: mediaheight,
                mediawidth: mediawidth,
                buttontext: "log out",
                prefixicon: Icons.logout,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            //  backgroundColor: Colors.transparent.withOpacity(0.5),
                            title: const Text('Log out'),
                            content: const Text(
                                "Are you sure you want \nto log out?"),
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
                                  SocketIo().disconnectSocket();
                                  await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserLogin()),
                                      (route) => false);
                                },
                                child: const Text('logout'),
                              ),
                            ],
                          ));
                },
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: SocialsIcons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
