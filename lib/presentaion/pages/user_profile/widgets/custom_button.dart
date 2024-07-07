import 'package:flutter/material.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/pages/edit_profile/edit_profile_page.dart';
import 'package:zora/presentaion/pages/settings/settings_page.dart';

class CustomButtonForProfile extends StatelessWidget {
  final UserModel userModel;
  const CustomButtonForProfile({
    super.key,
    required this.mediawidth,
    required this.userModel,
  });

  final double mediawidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditProfileScreen(user: userModel)));
            },
            child: Container(
              width: mediawidth / 2.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: kblack,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          kwidht10,
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()));
            },
            child: Container(
              width: mediawidth / 2.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: kblack,
                      ),
                    ),
                    kwidht10,
                    Icon(
                      Customiconsflutter.setting_line,
                      size: 15,
                      color: kblack,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}