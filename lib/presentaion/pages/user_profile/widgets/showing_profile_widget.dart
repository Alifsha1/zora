import 'package:flutter/material.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/core/style/colors/colors.dart';
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
      height: 370,
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            right: 20,
            child: Icon(
              Customiconsflutter.settingline,
              size: 25,
              color: kwhite,
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
                image: DecorationImage(
                  image: userModel!.coverPic == null ||
                          userModel!.coverPic!.isEmpty
                      ? const AssetImage('assets/images/placeholder cover.png')
                      : NetworkImage(userModel!.coverPic!) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: mediaheight * .13,
            right: mediawidth * .3,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: kwhite,
              child: CircleAvatar(
                radius: 63,
                backgroundImage: userModel!.profilePicture == null ||
                        userModel!.profilePicture!.isEmpty
                    ? const AssetImage('assets/images/placeholderimage.jpg')
                    : NetworkImage(userModel!.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: mediaheight * .07),
                child: Text(
                  userModel!.fullName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kblack,
                      fontSize: 23),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: mediaheight * .02),
                child: Text(
                  userModel!.bio?.isNotEmpty == true ? userModel!.bio! : 'Bio',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: kgrey,
                      fontSize: 23),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
