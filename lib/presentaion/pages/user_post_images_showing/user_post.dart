import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/pages/user_post_images_showing/widget/user_post_widget.dart';

class UsersPostImages extends StatefulWidget {
  final UserModel? userModel;
  final int? index;
  const UsersPostImages({
    super.key,
    required this.userModel,
    required this.index,
  });

  @override
  State<UsersPostImages> createState() => _UsersPostImagesState();
}

class _UsersPostImagesState extends State<UsersPostImages> {
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
              titles: 'Posts',
              color: kblack,
              fontsize: 15,
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 228, 246, 246),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: UserPostWidget(
          mediaheight: mediaheight,
          mediawidth: mediawidth,
          userModel: widget.userModel!,
          index: widget.index!,
        ),
      ),
    );
  }
}
