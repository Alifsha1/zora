import 'package:flutter/material.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/pages/explore_page/widget/search_follow_button.dart';
import 'package:zora/presentaion/pages/explore_page/widget/truncatedText.dart';

class SearchMainCard extends StatelessWidget {
  final UserModel user;
  final UserModel currentusermodel;

  final String currentuserid;
  const SearchMainCard(
      {super.key,
      required this.mediaheight,
      required this.user,
      required this.currentuserid,
      required this.currentusermodel
      });

  final double mediaheight;

  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    return Container(
      height: mediaheight * .28,
      width: mediaheight * .20,
      decoration: BoxDecoration(
          color: kwhite,
          // border: Border.all(
          //   color: kblack,
          // ),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: kwhite,
              //  backgroundImage: NetworkImage(user.profilePicture!)as ImageProvider,
              backgroundImage:
                  user.profilePicture == null || user.profilePicture!.isEmpty
                      ? const AssetImage('assets/images/placeholderimage.jpg')
                      : NetworkImage(user.profilePicture!) as ImageProvider,
            ),
            // kwidht3,

            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: BoldTitles(
                titles: user.username!,
                fontsize: 15,
              ),
            ),
            //kwidht10,
            Truncatedtext(
              bio: user.bio!.isEmpty ? 'bio' : user.bio!,
            ),

            kwidht10,
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: FollowButtonOnSearchResult(
                  mediawidth: mediawidth,
                  userModel: user,
                  currentuserid: currentuserid,
                  currentusermodel: currentusermodel,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
