import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/delete_post/delete_post_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/profile/widgets/image_preview.dart';

class UserPostWidget extends StatefulWidget {
  final UserModel userModel;
  final int index;

  const UserPostWidget({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.userModel,
    required this.index,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  State<UserPostWidget> createState() => _UserPostWidgetState();
}

class _UserPostWidgetState extends State<UserPostWidget> {
  final ScrollController scrollController = ScrollController();
  List<PostModel> posts = [];
  @override
  void initState() {
    // context.read<DeletePostBloc>();
    posts = widget.userModel.posts ?? [];
    log('${widget.index}');
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (scrollController.hasClients) {
          scrollController.position.jumpTo(widget.index * 350);
        }
      },
    );
    super.initState();
  }

  void deletePost(String postId) {
    setState(() {
      posts.removeWhere((post) => post.id == postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeletePostBloc, DeletePostState>(
      listener: (context, state) {
        if (state is DeletePostSuccessState) {
          context
              .read<UserProfileBloc>()
              .add(UserProfileInitialDetailsFetchEvent());
          customSnackbar(context, 'succussfully deleted', Colors.green);
        } else if (State is DeletePostErrorState) {
          customSnackbar(
              context, 'Something wrong try again later', Colors.red);
        }
      },
      builder: (context, state) {
        return BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
          return ListView.builder(
              itemCount: widget.userModel.posts!.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                final post = widget.userModel.posts![index];
             final time =    formatTimeAgo(post.createdAt!);
                final mediaURLs =
                    post.mediaURL != null && post.mediaURL!.isNotEmpty
                        ? post.mediaURL!
                        : [];

                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Stack(
                    children: [
                      mediaURLs.length > 1
                          ? GestureDetector(
                              onTap: () {
                                navigatorPush(
                                    ImagePreviewScreen(
                                      images: mediaURLs,
                                    ),
                                    context);
                              },
                              child: ConstrainedBox(
                                constraints: BoxConstraints.loose(
                                    Size(widget.mediawidth, 350)),
                                child: Swiper(
                                  itemBuilder: (context, pageIndex) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              mediaURLs[pageIndex]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: mediaURLs.length,
                                  pagination: const SwiperPagination(
                                    margin: EdgeInsets.all(5.0),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                navigatorPush(
                                    ImagePreviewScreen(images: mediaURLs),
                                    context);
                              },
                              child: Container(
                                height: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                    image: NetworkImage(mediaURLs[0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                      Positioned(
                        top: 20,
                        left: 20,
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
                                  backgroundColor: Colors.white,
                                  backgroundImage: widget
                                                  .userModel.profilePicture ==
                                              null ||
                                          widget
                                              .userModel.profilePicture!.isEmpty
                                      ? const AssetImage(
                                          'assets/images/placeholderimage.jpg')
                                      : NetworkImage(
                                              widget.userModel.profilePicture!)
                                          as ImageProvider,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.userModel.username!,
                                      style: const TextStyle(
                                        color: kwhite,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                     time,
                                      style: TextStyle(
                                        color: kwhite,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
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
                                      const PopupMenuItem(
                                        value: 'Save',
                                        child: Text(
                                          'Save',
                                          style: TextStyle(color: kwhite),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        onTap: () {
                                         showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                      //  backgroundColor: Colors.transparent.withOpacity(0.5),
                            title: const Text('Delete post'),
                            content:
                                const Text("Are you sure you want \nto delete?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  context.read<DeletePostBloc>().add(
                                              DeletePostfromProfileEvent(
                                                  postid: post.id!));
                                          deletePost(post.id!);
                                          context.read<UserProfileBloc>().add(
                                              UserProfileInitialDetailsFetchEvent());
                                },
                                child: const Text('delete',style: TextStyle(color: kred),),
                              ),
                            ],
                          ));
                                        },
                                        value: 'Delete',
                                        child: const Text(
                                          'Delete',
                                          style: TextStyle(color: kwhite),
                                        ),
                                      ),
                                    ];
                                  });
                            })),
                      ),
                      const Positioned(
                        bottom: 50,
                        left: 20,
                        child: Icon(
                          FeatherIcons.heart,
                          size: 25,
                          color: kwhite,
                        ),
                      ),
                      const Positioned(
                        bottom: 50,
                        left: 50,
                        child: Text(
                          '3568',
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 50,
                        left: 100,
                        child: Icon(
                          FeatherIcons.messageCircle,
                          size: 25,
                          color: kwhite,
                        ),
                      ),
                      const Positioned(
                        bottom: 50,
                        left: 130,
                        child: Text(
                          '3568',
                          style: TextStyle(
                            color: kwhite,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Text(
                          post.description ?? '',
                          style: const TextStyle(
                            color: kwhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
      },
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
