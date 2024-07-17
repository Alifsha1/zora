import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/bloc/save_Unsave_post/save_un_save_post_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/home_screen/sections/like_com_sec.dart';
import 'package:zora/presentaion/pages/user_profile/user_profile.dart';

class PostContainer extends StatefulWidget {
  final UserModel user;
  final PostModel post;
  final int indexofpost;
  const PostContainer({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.user,
    required this.post,
    required this.indexofpost,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
      bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    context.read<UserProfileBloc>().add(UserProfileInitialDetailsFetchEvent());
    final time = formatTimeAgo(widget.post.createdAt!);

    return Container(
      height: 350,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(5, 5),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(widget.post.mediaURL![0]),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [-0.0, 0.70],
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                context
                    .read<ProfileFetchByIdBloc>()
                    .add(ProfileFetchingByIdEvent(userid: widget.user.id!));
                navigatorPush(const UserProfileScreen(), context);
              },
              child: Container(
                height: widget.mediaheight * 0.07,
                width: widget.mediawidth * 0.4,
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(.5),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 23,
                        // backgroundColor: Colors.white,
                        backgroundImage: widget.user.profilePicture == null ||
                                widget.user.profilePicture!.isEmpty
                            ? const AssetImage(
                                'assets/images/placeholderimage.jpg')
                            : NetworkImage(widget.user.profilePicture!)
                                as ImageProvider,
                      ),
                      Column(
                        children: [
                          Text(
                            widget.user.username!,
                            style: const TextStyle(
                              color: kwhite,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(time,
                              style: const TextStyle(
                                color: kwhite,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.transparent.withOpacity(.5),
                child: Builder(builder: (BuildContext context) {
                  return PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.more_vert,
                        color: kwhite,
                      ),
                      color: Colors.transparent.withOpacity(0.5),
                      onSelected: (String value) {},
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            onTap: !isSaved
                                ? () {
                                   context
                                        .read<SaveUnSavePostBloc>()
                                        .add(SavePostEvent(postid: widget.post.id!));
                                    isSaved = true;
                                  }
                                : () {
                                   context
                                        .read<SaveUnSavePostBloc>()
                                        .add(UnsavePostEvent(postid: widget.post.id!));
                                    isSaved = false;
                                },
                            child: isSaved
                                ? const Text(
                                    'UnSave',
                                    style: TextStyle(color: kwhite),
                                  )
                                : const Text(
                                    'Save',
                                    style: TextStyle(color: kwhite),
                                  ),
                          ),
                          const PopupMenuItem(
                            child: Text(
                              'Report',
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                        ];
                      });
                })),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: LikeComSecWidget(user: widget.user, post: widget.post),
            ),
          ),
        ],
      ),
    );
  }

  String formatTimeAgo(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return DateFormat('yMMMd').format(dateTime); // e.g., Jan 1, 2024
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return 'yesterday';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }
}
