import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/user_model/user_model.dart';

class AccountInfoPost extends StatelessWidget {
  const AccountInfoPost({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.userModel,
  });

  final double mediaheight;
  final double mediawidth;
    final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              Text(
                '2k',
                style: TextStyle(
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
          const Column(
            children: [
              Text(
                '1k',
                style: TextStyle(
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
                userModel!.posts!.length.toString(),
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