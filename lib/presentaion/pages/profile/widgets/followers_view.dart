import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/Widgets/user_list_tile.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/pages/user_profile/user_profile.dart';

class FollowersViewList extends StatefulWidget {
  final UserModel userModel;
  //   final String currentuserid;
  // final UserModel currentuserModel;
  const FollowersViewList({super.key, required this.userModel,
  //  required this.currentuserid, required this.currentuserModel
   });

  @override
  State<FollowersViewList> createState() => _FollowersViewListState();
}

class _FollowersViewListState extends State<FollowersViewList> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return widget.userModel.followers!.isNotEmpty
        ? ListView.builder(
            itemCount: widget.userModel.followers!.length,
            controller: scrollController,
            itemBuilder: (context, index) {
              final follower = widget.userModel.followers![index];
              log('followers list id :${follower['_id']}'); 
              log('followers fullname id :${follower['fullname']}');
              log('followers username id :${follower['username']}');
              return UserListTile(
                // currentuserModel: widget.currentuserModel,
                // currentuserid: widget.currentuserid,
                userModel: widget.userModel,
                id: follower['_id'],
                  onTap: () {
                    context
                        .read<ProfileFetchByIdBloc>()
                        .add(ProfileFetchingByIdEvent(userid: follower['_id']));
                    navigatorPush(const UserProfileScreen(), context);
                  },
                  profileUrl: follower['profile_picture'].toString(),
                  fullname: follower['fullname'].toString(),
                  username: follower['username'].toString(),
                  
                  );
             
            },
          )
        : const Center(
            child: Text('No followers yet.'),
          );
  }
}
