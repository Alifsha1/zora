import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/widgets/user_savedpost_widget.dart';

class UserSavedPostimage extends StatefulWidget {
  final UserModel? userModel;
  final List<PostModel?> savedpostmodel;
  final int? index;
  final String title;
  const UserSavedPostimage({
    super.key,
    required this.userModel,
    required this.index,
    required this.title,
    required this.savedpostmodel,
  });

  @override
  State<UserSavedPostimage> createState() => _UserSavedPostimageState();
}

class _UserSavedPostimageState extends State<UserSavedPostimage> {
  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            NormalBondTitles(titles: widget.userModel!.username!),
            // ignore: prefer_const_constructors
            BoldTitles(
              titles: widget.title,
              color: kblack,
              fontsize: 15,
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 228, 246, 246),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: UserSavedpostWidget(
          mediaheight: mediaheight,
          mediawidth: mediawidth,
          userModel: widget.userModel!,
          index: widget.index!,
          savedpost: widget.savedpostmodel,
        ),
      ),
    );
  }
}
