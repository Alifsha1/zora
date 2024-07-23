import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/core/utils/format_time_date.dart';
import 'package:zora/data/models/post_model/post_model.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/home_screen/sections/like_com_sec.dart';
import 'package:zora/presentaion/pages/home_screen/sections/pop_up_menu_section.dart';
import 'package:zora/presentaion/pages/nav_bar/nav_bar.dart';
import 'package:zora/presentaion/pages/user_profile/user_profile.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/widgets/user_by_id.dart';

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
  @override
  void initState() {
    context.read<UserProfileBloc>().add(UserProfileInitialDetailsFetchEvent());
    super.initState();
  }

  bool? isSaved;
  @override
  Widget build(BuildContext context) {
    final time = formatTimeAgo(widget.post.createdAt!);

    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
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
            child: BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                context.watch<UserProfileBloc>().state;
                if (state is UserProfileSuccessfulState) {
                  return GestureDetector(
                    onTap: () {
                      if (widget.post.user!.id == state.user.id) {
                        indexChangeNotifier.value = 3;
                      } else {
                        context.read<ProfileFetchByIdBloc>().add(
                            ProfileFetchingByIdEvent(userid: widget.user.id!));
                        navigatorPush(const UserProfileScreen(), context);
                      }
                    },
                    child: UserByIdName(
                        mediaheight: widget.mediaheight,
                        mediawidth: widget.mediawidth,
                        backgroundImage: widget.user.profilePicture == null ||
                                widget.user.profilePicture!.isEmpty
                            ? const AssetImage(
                                'assets/images/placeholderimage.jpg')
                            : NetworkImage(widget.user.profilePicture!)
                                as ImageProvider,
                        username: widget.user.fullName!,
                        time: time),
                  );
                }
                return Container();
              },
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: PopUpMenuSection(postid: widget.post.id),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LikeComSecWidget(user: widget.user, post: widget.post),
          ),
        ],
      ),
    );
  }
}
