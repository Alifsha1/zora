import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/presentaion/Widgets/normal_bond_titles.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/profile/widgets/account_info_post.dart';
import 'package:zora/presentaion/pages/profile/widgets/loading_pages/profile_loading.dart';
import 'package:zora/presentaion/pages/profile/widgets/post_view.dart';
import 'package:zora/presentaion/pages/profile/widgets/showing_profile_widget.dart';
import 'package:zora/presentaion/pages/user_profile/widget/follow_button.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    context.read<ProfileFetchByIdBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(
          builder: (context) {
            final stateA = context.watch<ProfileFetchByIdBloc>().state;

            final stateB = context.watch<UserProfileBloc>().state;
            if (stateB is UserProfileSuccessfulState) {
              if (stateA is ProfileFetchByIdSuccessState) {
                log('user profile posts : ${stateA.posts.length.toString()}');
                return ListView(
                  children: [
                    Column(
                      children: [
                        ShowingProfileWidget(
                          userModel: stateA.user,
                          //  onprofile: true,
                          // isCurrentUser: false,
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                        ),
                        FollowButton(
                          message: true,
                          mediawidth: mediawidth,
                          userModel: stateA.user,
                          currentuserid: stateB.user.id!,
                          currentusermodel: stateB.user,
                        ),
                        AccountInfoPost(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          userModel: stateA.user,
                          posts: stateA.posts,
                          // currentuserModel: stateB.user,
                          // currentuserid: stateB.user.id!,
                        ),
                        // CustomTabBar(
                        //   tabController: tabController,
                        // ),
                        kheight5,
                        const NormalBondTitles(titles: 'Posts'),
                        PostGridView(userModel: stateA.user)
                        // UserPostsGridView(userModel: stateA.user,posts: stateA.posts,)
                        // CustomTabView(
                        //   tabController: tabController,
                        //   userModel: state.user,
                        // ),
                      ],
                    ),
                  ],
                );
              } else {
                return ProfileLoading(
                    mediaheight: mediaheight, mediawidth: mediawidth);
              }
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
