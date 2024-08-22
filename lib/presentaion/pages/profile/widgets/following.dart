import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/pages/profile/widgets/following_view_list.dart';

class FollowingList extends StatefulWidget {
   final UserModel userModel;
  const FollowingList({super.key,required this.userModel});

  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
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
            titles: 'Following',
          ),
          centerTitle: true,
          backgroundColor: maincolor,
        ),
        body: FollowingViewList(
          userModel: widget.userModel,
          // currentuserModel: widget.currentuserModel,
          // currentuserid: widget.currentuserid,
        ));
  }
}