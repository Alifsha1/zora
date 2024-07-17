// import 'package:flutter/material.dart';
// import 'package:zora/core/constants/contants.dart';
// import 'package:zora/core/icons/customiconsflutter_icons.dart';
// import 'package:zora/core/style/colors/colors.dart';
// import 'package:zora/data/models/user_model/user_model.dart';
// import 'package:zora/presentaion/pages/edit_profile/edit_profile_page.dart';

// class FollowButton extends StatefulWidget {
//   final UserModel userModel;
//   const FollowButton({
//     super.key,
//     required this.mediawidth,
//     required this.userModel,
//   });

//   final double mediawidth;

//   @override
//   State<FollowButton> createState() => _FollowButtonState();
// }

// class _FollowButtonState extends State<FollowButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10, top: 10),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {

//             },
//             child: Container(
//               width: widget.mediawidth / 2.15,
//               decoration: BoxDecoration(
//                 color: kblue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.all(6),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'follow',
//                       style: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: kwhite,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           kwidht10,
//           GestureDetector(
//             onTap: () {

//             },
//             child: Container(
//               width: widget.mediawidth / 2.15,
//               decoration: BoxDecoration(
//                 color: kwhite,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.all(6.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'message',
//                       style: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: kblack,
//                       ),
//                     ),
//                     kwidht10,

//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/folllow_unfollow.dart/follow_unfollow_user_bloc.dart';

class FollowButton extends StatefulWidget {
  final UserModel userModel;
  final String currentuserid;
  final double mediawidth;

  const FollowButton(
      {super.key,
      required this.mediawidth,
      required this.userModel,
      required this.currentuserid});

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool isFollowback = false;
  bool isFollowing = false;
  String? userid;

  // void toggleFollow() {
  //   setState(() {
  //     isFollowing = !isFollowing;
  //   });
  // }
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('Is Follow Back: $isFollowback');

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: [
          GestureDetector(
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
                        context.read<FollowUnfollowUserBloc>().add(
                            UnFollowUserEvent(userid: widget.userModel.id!));
                        isFollowing = !isFollowing;
                        isFollowback = false;
                          if(userid == widget.currentuserid){
                               isFollowback = true;
                          }else{
                               isFollowback = false;
                          }
                        setState(() {});
                      }
                    : () {
                        context.read<FollowUnfollowUserBloc>().add(
                            FollowUserEvent(
                                userid: widget.userModel.id!,
                                user: widget.userModel));
                        isFollowing = !isFollowing;
                        setState(() {});
                      },
            child: Container(
              width: widget.mediawidth / 2.15,
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
          ),
          kwidht10,
          GestureDetector(
            onTap: () {
              // Add your message functionality here
            },
            child: Container(
              width: widget.mediawidth / 2.15,
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
    );
  }
}
