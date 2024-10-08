
import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/pages/profile/widgets/followers_view.dart';

class FollowerList extends StatefulWidget {
  final String userid;
  // final UserModel currentuserModel;
   final UserModel userModel;
  const FollowerList(
      {super.key,
      required this.userModel, required this.userid,
     // required this.currentuserid,
      //required this.currentuserModel,
      });

  @override
  State<FollowerList> createState() => _FollowerListState();
}

class _FollowerListState extends State<FollowerList> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // final follower = widget.userModel.followers;
    // context.read<ProfileFetchByIdBloc>().add(
    //     ProfileFetchingByIdEvent(userid: widget.userModel.followers!['']));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const NormalBondTitles(
            titles: 'Followers',
          ),
          centerTitle: true,
          backgroundColor: maincolor,
        ),
        body: FollowersViewList(
          userid: widget.userid,
          userModel: widget.userModel,
          // currentuserModel: widget.currentuserModel,
          // currentuserid: widget.currentuserid,
        ));
  }
}
