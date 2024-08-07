import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/folllow_unfollow.dart/follow_unfollow_user_bloc.dart';
import 'package:zora/presentaion/pages/message/chat/user_chat_page.dart';

class FollowButton extends StatefulWidget {
  final UserModel userModel;
  final UserModel currentusermodel;
  final String currentuserid;
  final double? mediawidth;
  final bool message;
  const FollowButton(
      {super.key,
      this.mediawidth,
      required this.userModel,
      required this.currentuserid,
      required this.currentusermodel,
      required this.message});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowback = false;
  bool isFollowing = false;
  String? userid;

  @override
  void initState() {
    //log('init working or not${widget.userModel.following}');
    log('Current User Id: ${widget.currentuserid}');
    for (int i = 0; i < widget.userModel.following!.length; i++) {
      log('Following: ${widget.userModel.following![i]['_id']}');
      if (widget.userModel.following![i]['_id'].toString() ==
          widget.currentuserid) {
        userid = widget.userModel.following![i]['_id'].toString();
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

    return widget.message
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Handling follow and unfollow logic
                    if (isFollowback && isFollowing) {
                      // Scenario: Following back and unfollowing
                      context
                          .read<FollowUnfollowUserBloc>()
                          .add(UnFollowUserEvent(userid: widget.userModel.id!));
                      isFollowing = false;
                    } else if (isFollowback && !isFollowing) {
                      // Scenario: Follow back and start following
                      context.read<FollowUnfollowUserBloc>().add(
                          FollowUserEvent(
                              userid: widget.userModel.id!,
                              user: widget.userModel));
                      isFollowing = true;
                    } else if (!isFollowback && isFollowing) {
                      // Scenario: Following but not followed back and unfollowing
                      context
                          .read<FollowUnfollowUserBloc>()
                          .add(UnFollowUserEvent(userid: widget.userModel.id!));
                      isFollowing = false;
                    } else {
                      // Scenario: Not following and decide to follow
                      context.read<FollowUnfollowUserBloc>().add(
                          FollowUserEvent(
                              userid: widget.userModel.id!,
                              user: widget.userModel));
                      isFollowing = true;
                      if (isFollowback) {
                        // Assume userModel has followingMe flag
                        isFollowback = true;
                      }
                    }
                    setState(() {});
                  },
                  child: Container(
                    width: widget.mediawidth! / 2.15,
                    decoration: BoxDecoration(
                      color: (isFollowback && isFollowing) || !isFollowing
                          ? kblue
                          : kblue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (isFollowback && isFollowing)
                                ? 'unfollow'
                                : isFollowback
                                    ? 'followback'
                                    : isFollowing
                                        ? 'unfollow'
                                        : 'Follow',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color:
                                  (isFollowback && isFollowing) || !isFollowing
                                      ? kwhite
                                      : kblack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                kwidht10,
                GestureDetector(
                  onTap: () {
                    // Add your message functionality here
                    navigatorPush(UserChatPage(user: widget.userModel), context);
                  },
                  child: Container(
                    width: widget.mediawidth! / 2.15,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Message',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: kblack,
                            ),
                          ),
                          kwidht10,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () {
              // Handling follow and unfollow logic
              if (isFollowback && isFollowing) {
                // Scenario: Following back and unfollowing
                context
                    .read<FollowUnfollowUserBloc>()
                    .add(UnFollowUserEvent(userid: widget.userModel.id!));
                isFollowing = false;
              } else if (isFollowback && !isFollowing) {
                // Scenario: Follow back and start following
                context.read<FollowUnfollowUserBloc>().add(FollowUserEvent(
                    userid: widget.userModel.id!, user: widget.userModel));
                isFollowing = true;
              } else if (!isFollowback && isFollowing) {
                // Scenario: Following but not followed back and unfollowing
                context
                    .read<FollowUnfollowUserBloc>()
                    .add(UnFollowUserEvent(userid: widget.userModel.id!));
                isFollowing = false;
              } else {
                // Scenario: Not following and decide to follow
                context.read<FollowUnfollowUserBloc>().add(FollowUserEvent(
                    userid: widget.userModel.id!, user: widget.userModel));
                isFollowing = true;
                if (isFollowback) {
                  // Assume userModel has followingMe flag
                  isFollowback = true;
                }
              }
              setState(() {});
            },
            child: Container(
              //  width: widget.mediawidth! / 2.15,
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                color: (isFollowback && isFollowing) || !isFollowing
                    ? kblue
                    : kblue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (isFollowback && isFollowing)
                          ? 'unfollow'
                          : isFollowback
                              ? 'followback'
                              : isFollowing
                                  ? 'unfollow'
                                  : 'Follow',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: (isFollowback && isFollowing) || !isFollowing
                            ? kwhite
                            : kblack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
