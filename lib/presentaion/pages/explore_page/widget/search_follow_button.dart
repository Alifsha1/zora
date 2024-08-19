import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/folllow_unfollow.dart/follow_unfollow_user_bloc.dart';

class FollowButtonOnSearchResult extends StatefulWidget {
  final UserModel userModel;
  final UserModel currentusermodel;
  final String currentuserid;
  final double mediawidth;

  const FollowButtonOnSearchResult(
      {super.key,
      required this.mediawidth,
      required this.userModel,
      required this.currentuserid,
      required this.currentusermodel
      });

  @override
  State<FollowButtonOnSearchResult> createState() =>
      _FollowButtonOnSearchResultState();
}

class _FollowButtonOnSearchResultState
    extends State<FollowButtonOnSearchResult> {
  bool isFollowback = false;
  bool isFollowing = false;
  String? userid;

  @override
  void initState() {
    //log('init working or not${widget.userModel.following}');
    log('Current User Id: ${widget.currentuserid}');
    for (int i = 0; i < widget.userModel.following!.length; i++) {
     // log('Following: ${widget.userModel.following![i]['_id']}');
      if (widget.userModel.following![i].toString() ==
          widget.currentuserid) {
        userid = widget.userModel.following![i].toString();
        log('message');
        isFollowback = true;
        setState(() {});
      }
    }
    for (int i = 0; i < widget.currentusermodel.following!.length; i++) {
      log('Following: ${widget.currentusermodel.following![i]['_id']}');
      if (widget.currentusermodel.following![i]['_id'].toString() ==
          widget.userModel.id) {
        userid = widget.currentusermodel.following![i]['_id'].toString();
        log('message');
        isFollowing = true;
        setState(() {});
      }

      
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('Is Follow Back: $isFollowback');

    return GestureDetector(
      //onTap: toggleFollow,
      onTap: isFollowback
          ? () {
              context.read<FollowUnfollowUserBloc>().add(FollowUserEvent(
                  userid: widget.userModel.id!, user: widget.userModel));
              isFollowing = true;
              isFollowback = !isFollowback;
              setState(() {});
            }
          : isFollowing
              ? () {
                  context
                      .read<FollowUnfollowUserBloc>()
                      .add(UnFollowUserEvent(userid: widget.userModel.id!));
                  isFollowing = !isFollowing;
                  isFollowback = false;
                  if (userid == widget.currentuserid) {
                    isFollowback = true;
                  } else {
                    isFollowback = false;
                  }
                  setState(() {});
                }
              : () {
                  context.read<FollowUnfollowUserBloc>().add(FollowUserEvent(
                      userid: widget.userModel.id!, user: widget.userModel));
                  isFollowing = !isFollowing;
                  setState(() {});
                },
      child: Container(
        // width: 90,
        // height: 30,
        width: widget.mediawidth * 0.28,
        //  width: widget.mediawidth / 0.15,
        decoration: BoxDecoration(
          color: isFollowback || !isFollowing ? kblue : kblue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFollowback
                    ? 'followback'
                    : isFollowing
                        ? 'unfollow'
                        : 'Follow',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: isFollowback || !isFollowing ? kwhite : kblack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
