import 'dart:developer';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/utils/format_time_date.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/save_Unsave_post/save_un_save_post_bloc.dart';
import 'package:zora/presentaion/bloc/saved_posts/saved_posts_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/home_screen/sections/like_com_sec.dart';
import 'package:zora/presentaion/pages/profile/widgets/image_preview.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/widgets/pop_up_menu_widget.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/widgets/user_by_id.dart';

class UserSavedpostWidget extends StatefulWidget {
  final UserModel userModel;
  final List<PostModel?> savedpost;
  final int index;

  const UserSavedpostWidget({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.userModel,
    required this.index,
    required this.savedpost,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  State<UserSavedpostWidget> createState() => _UserSavedpostWidgetState();
}

class _UserSavedpostWidgetState extends State<UserSavedpostWidget> {
  final ScrollController scrollController = ScrollController();
  List<PostModel?> posts = [];
  @override
  void initState() {
    // context.read<DeletePostBloc>();
    posts = widget.savedpost ;
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

  void unsavePost(String postId) {
    setState(() {
      posts.removeWhere((post) => post!.id == postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // context.read<SavedPostsBloc>().add(GetSavedPostEvent());
    return BlocConsumer<SavedPostsBloc, SavedPostsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
          return ListView.builder(
              itemCount: widget.savedpost.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                final post = widget.savedpost[index];
                final time = formatTimeAgo(post!.createdAt!);
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
                        child: UserByIdName(
                            mediaheight: widget.mediaheight,
                            mediawidth: widget.mediawidth,
                            backgroundImage:
                                widget.savedpost[index]!.user!.profilePicture ==
                                            null ||
                                        widget.savedpost[index]!.user!
                                            .profilePicture!.isEmpty
                                    ? const AssetImage(
                                        'assets/images/placeholderimage.jpg')
                                    : NetworkImage(widget
                                        .savedpost[index]!
                                        .user!
                                        .profilePicture!) as ImageProvider,
                            username: widget.savedpost[index]!.user!.username!,
                            time: time),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: PopUpMenuWidgetButton(
                          buttontxt: 'Unsave',
                          txt2: 'Report',
                          onTap1: () {
                            context.read<SaveUnSavePostBloc>().add(
                                UnsavePostEvent(
                                    postid: widget.savedpost[index]!.id!));
                            unsavePost(widget.savedpost[index]!.id!);
                            context
                                .read<SavedPostsBloc>()
                                .add(GetSavedPostEvent());
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: LikeComSecWidget(
                            user: widget.userModel, post: post),
                      ),
                    ],
                  ),
                );
              });
        });
      },
    );
  }
}
