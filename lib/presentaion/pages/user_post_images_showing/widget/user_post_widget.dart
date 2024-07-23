import 'dart:developer';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/utils/alerts.dart';
import 'package:zora/core/utils/format_time_date.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/delete_post/delete_post_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/home_screen/sections/like_com_sec.dart';
import 'package:zora/presentaion/pages/profile/widgets/image_preview.dart';
import 'package:zora/presentaion/pages/user_post_images_showing/widget/pop_up_menu_profile.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/widgets/user_by_id.dart';

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
                final time = formatTimeAgo(post.createdAt!);
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
                            backgroundImage: widget.userModel.profilePicture ==
                                        null ||
                                    widget.userModel.profilePicture!.isEmpty
                                ? const AssetImage(
                                    'assets/images/placeholderimage.jpg')
                                : NetworkImage(widget.userModel.profilePicture!)
                                    as ImageProvider,
                            username: widget.userModel.fullName!,
                            time: time),
                      ),
                      Positioned(
                          top: 20,
                          right: 20,
                          child: PopUpMenuProfileButtonWidget(
                            postid: post.id,
                            userModel: widget.userModel,
                            index: widget.index,
                          )),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: LikeComSecWidget(
                              user: widget.userModel, post: post))
                    ],
                  ),
                );
              });
        });
      },
    );
  }

}
