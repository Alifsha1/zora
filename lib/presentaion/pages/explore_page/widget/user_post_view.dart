import 'dart:developer';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/utils/format_time_date.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/get_all_post/get_all_post_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/home_screen/sections/like_com_sec.dart';
import 'package:zora/presentaion/pages/profile/widgets/image_preview.dart';
import 'package:zora/presentaion/pages/user_post_images_showing/widget/pop_up_menu_profile.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/widgets/user_by_id.dart';

bool searchbarValue = false;

class UserPostViewWidget extends StatefulWidget {
  final int currentindex;

  const UserPostViewWidget({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.currentindex,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  State<UserPostViewWidget> createState() => _UserPostViewWidgetState();
}

class _UserPostViewWidgetState extends State<UserPostViewWidget> {
  final ScrollController scrollController = ScrollController();
  int? cindex;

  @override
  void initState() {
    cindex = widget.currentindex;
    // context.read<DeletePostBloc>();

    log('${widget.currentindex}');
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (scrollController.hasClients) {
          scrollController.position.jumpTo(widget.currentindex * 350);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetAllPostBloc, GetAllPostState>(
          builder: (context, state) {
        if (state is GetAllPostSuccessState) {
          return ListView.builder(
              itemCount: state.posts.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                final time = formatTimeAgo(post.createdAt!);
                // final mediaURLs =
                //     post.mediaURL != null && post.mediaURL!.isNotEmpty
                //         ? post.mediaURL!
                //         : [];

                return Container(
                  margin:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Stack(
                    children: [
                      post.mediaURL!.length > 1
                          ? GestureDetector(
                              onTap: () {
                                navigatorPush(
                                    ImagePreviewScreen(
                                      images: post.mediaURL!,
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
                                              post.mediaURL![pageIndex]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: post.mediaURL!.length,
                                  pagination: const SwiperPagination(
                                    margin: EdgeInsets.all(5.0),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                navigatorPush(
                                    ImagePreviewScreen(images: post.mediaURL!),
                                    context);
                              },
                              child: Container(
                                height: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  image: DecorationImage(
                                    image: NetworkImage(post.mediaURL![0]),
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
                                post.user!.profilePicture == null ||
                                        post.user!.profilePicture!.isEmpty
                                    ? const AssetImage(
                                        'assets/images/placeholderimage.jpg')
                                    : NetworkImage(post.user!.profilePicture!)
                                        as ImageProvider,
                            username: post.user!.fullName!,
                            time: time),
                      ),
                      Positioned(
                          top: 20,
                          right: 20,
                          child: PopUpMenuProfileButtonWidget(
                            postid: post.id,
                            userModel: post.user!,
                            index: widget.currentindex,
                          )),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: LikeComSecWidget(user: post.user!, post: post))
                    ],
                  ),
                );
              });
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
