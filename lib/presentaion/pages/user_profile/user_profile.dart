import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/presentaion/bloc/profile_fetch_by_id.dart/profile_fetch_by_id_bloc.dart';
import 'package:zora/presentaion/bloc/profile_of_users_bloc/profile_bloc.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/profile/widgets/account_info_post.dart';
import 'package:zora/presentaion/pages/profile/widgets/custom_button.dart';
import 'package:zora/presentaion/pages/profile/widgets/custom_tabbar.dart';
import 'package:zora/presentaion/pages/profile/widgets/custom_tabbarview.dart';
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
        // child: BlocBuilder<ProfileFetchByIdBloc, ProfileFetchByIdState>(
        //   builder: (context, state) {
        //   if (state is ProfileFetchByIdSuccessState) {
        //     return ListView(
        //       children: [
        //         Column(
        //           children: [
        //             ShowingProfileWidget(
        //               userModel: state.user,
        //               //  onprofile: true,
        //               // isCurrentUser: false,
        //               mediaheight: mediaheight,
        //               mediawidth: mediawidth,
        //             ),
        //             FollowButton(
        //               mediawidth: mediawidth,
        //               userModel: state.user,
        //               currentuserid: ,
        //             ),
        //             AccountInfoPost(
        //               mediaheight: mediaheight,
        //               mediawidth: mediawidth,
        //               userModel: state.user,
        //             ),
        //             // CustomTabBar(
        //             //   tabController: tabController,
        //             // ),
        //             kheight5,
        //             // CustomTabView(
        //             //   tabController: tabController,
        //             //   userModel: state.user,
        //             // ),
        //           ],
        //         ),
        //       ],
        //     );
        //   }else{

        // return Center(
        //   child: CircularProgressIndicator(),
        // );
        //   }
        //   },
        // ),
        child: Builder(
          builder: (context) {
            final stateA = context.watch<ProfileFetchByIdBloc>().state;
            final stateB = context.watch<UserProfileBloc>().state;
            if (stateB is UserProfileSuccessfulState) {
              if (stateA is ProfileFetchByIdSuccessState) {
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
                          mediawidth: mediawidth,
                          userModel: stateA.user,
                          currentuserid: stateB.user.id!,
                        ),
                        AccountInfoPost(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          userModel: stateA.user,
                        ),
                        // CustomTabBar(
                        //   tabController: tabController,
                        // ),
                        kheight5,
                        // CustomTabView(
                        //   tabController: tabController,
                        //   userModel: state.user,
                        // ),
                      ],
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
