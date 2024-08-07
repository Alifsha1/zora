import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/user_list_tile.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/pages/user_profile/user_profile.dart';

class FollowingViewList extends StatefulWidget {
  final UserModel userModel;
  const FollowingViewList({super.key, required this.userModel});

  @override
  State<FollowingViewList> createState() => _FollowingViewListState();
}

class _FollowingViewListState extends State<FollowingViewList> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return widget.userModel.followers!.isNotEmpty
        ? ListView.builder(
            itemCount: widget.userModel.following!.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              final following = widget.userModel.following![index];
              log('followers list id :${following['_id']}'); 
              log('followers fullname id :${following['fullname']}');
              log('followers username id :${following['username']}');
              return UserListTile(
                // currentuserModel: widget.currentuserModel,
                // currentuserid: widget.currentuserid,
                userModel: widget.userModel,
                id: following['_id'],
                  onTap: () {
                    context
                        .read<ProfileFetchByIdBloc>()
                        .add(ProfileFetchingByIdEvent(userid: following['_id']));
                    navigatorPush(const UserProfileScreen(), context);
                  },
                  profileUrl: following['profile_picture'].toString(),
                  fullname: following['fullname'].toString(),
                  username: following['username'].toString(),
                  
                  );
             
            },
          )
        : const Center(
            child: Text('No followers yet.'),
          );
  }
}