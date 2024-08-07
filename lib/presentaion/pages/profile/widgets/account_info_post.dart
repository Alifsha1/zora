import 'package:flutter/material.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/pages/profile/widgets/follower_list.dart';
import 'package:zora/presentaion/pages/profile/widgets/following.dart';

class AccountInfoPost extends StatelessWidget {
  //   final String currentuserid;
  // final UserModel currentuserModel;
  const AccountInfoPost({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.userModel,
    this.posts, 
    //required this.currentuserid, required this.currentuserModel,
  });

  final double mediaheight;
  final double mediawidth;
  final UserModel? userModel;
  final List<PostModel>? posts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              navigatorPush(FollowerList(userModel: userModel!,
             // currentuserModel: currentuserModel,currentuserid: currentuserid,
              ), context);
            },
            child: Column(
              children: [
                Text(
                  userModel!.followers == null || userModel!.followers!.isEmpty
                      ? '0'
                      : userModel!.followers!.length.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: kblack,
                  ),
                ),
                Text(
                  'followers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: kgrey,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: mediaheight * .08,
            width: mediawidth * 0.01,
            child: const VerticalDivider(
              width: 10,
              thickness: 2,
              color: kgrey,
              endIndent: 10,
              indent: 1,
            ),
          ),
          GestureDetector(
            onTap: () {
               navigatorPush(FollowingList(userModel: userModel!,
             // currentuserModel: currentuserModel,currentuserid: currentuserid,
              ), context);
            },
            child: Column(
              children: [
                Text(
                  userModel!.following == null || userModel!.following!.isEmpty
                      ? '0'
                      : userModel!.following!.length.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: kblack,
                  ),
                ),
                Text(
                  'following',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: kgrey,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: mediaheight * .08,
            width: mediawidth * 0.01,
            child: const VerticalDivider(
              width: 10,
              thickness: 2,
              color: kgrey,
              endIndent: 10,
              indent: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Text(
                  userModel!.posts == null || userModel!.posts!.isEmpty
                      ? '0'
                      : userModel!.posts!.length.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: kblack,
                  ),
                ),
                const Text(
                  'Posts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: kgrey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
