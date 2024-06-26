import 'package:flutter/material.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/data/models/user_model/user_model.dart';

class ShowingProfileWidget extends StatelessWidget {
  final Widget? navigateedit;
  final Widget? navigatesettings;
  final UserModel? userModel;
  // final bool onprofile;
  // final bool isCurrentUser;
  const ShowingProfileWidget({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    this.navigateedit,
    this.navigatesettings,
    required this.userModel,
    //this.onprofile = false,
    //required this.isCurrentUser,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            right: 20,
            child: Icon(
              Customiconsflutter.setting_line,
              size: 25,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 00,
            right: 0,
            left: 0,
            child: Container(
              height: mediaheight * .26,
              width: mediawidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: const DecorationImage(
                  image: AssetImage('assets/images/test2.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: mediaheight * .16,
            right: mediawidth * .3,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 63,
                backgroundImage: userModel!.profilePicture == null ||
                        userModel!.profilePicture!.isEmpty
                    ? const AssetImage('assets/images/placeholderimage.jpg')
                    : NetworkImage(userModel!.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          // Positioned(
          //   bottom: mediaheight * .12,
          //   left: (mediawidth / 2.4),
          //   child: Text(
          //     userModel!.fullName!,
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //         fontSize: 23),
          //   ),
          // ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: mediaheight * .12),
                child: Text(
                  userModel!.fullName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 23),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: mediaheight * .08),
                child: Text(
                  userModel!.bio?.isNotEmpty == true ? userModel!.bio! : 'Bio',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 23),
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: mediaheight * .08,
          //   right: mediawidth * .29,
          //   child: Text(
          //     userModel!.bio?.isNotEmpty == true ? userModel!.bio! : 'Bio',
          //     style: TextStyle(
          //         fontWeight: FontWeight.normal,
          //         color: Colors.grey,
          //         fontSize: 23),
          //   ),
          // ),
          Positioned(
            bottom: mediaheight * .03,
            right: mediawidth * .59,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => navigateedit!));
              },
              child: Container(
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
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: mediaheight * .03,
            right: mediawidth * .19,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => navigatesettings!));
              },
              child: Container(
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
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Customiconsflutter.setting_line,
                        size: 15,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
