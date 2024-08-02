// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/profile/widgets/account_info_post.dart';
import 'package:zora/presentaion/pages/profile/widgets/custom_button.dart';
import 'package:zora/presentaion/pages/profile/widgets/custom_tabbar.dart';
import 'package:zora/presentaion/pages/profile/widgets/custom_tabbarview.dart';
import 'package:zora/presentaion/pages/profile/widgets/loading_pages/profile_loading.dart';
import 'package:zora/presentaion/pages/profile/widgets/showing_profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    context.read<UserProfileBloc>().add(UserProfileInitialDetailsFetchEvent());
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            BlocBuilder(
              bloc: context.read<UserProfileBloc>(),
              builder: (context, state) {
                if (state is UserProfileFetchLoadingState) {
                  return ProfileLoading(
                      mediaheight: mediaheight, mediawidth: mediawidth);
                }
                if (state is UserProfileSuccessfulState) {
                  return Column(
                    children: [
                      ShowingProfileWidget(
                        userModel: state.user,
                        //  onprofile: true,
                        // isCurrentUser: false,
                        mediaheight: mediaheight,
                        mediawidth: mediawidth,

                      ),
                      CustomButtonForProfile(
                        mediawidth: mediawidth,
                        userModel: state.user,
                      ),
                      AccountInfoPost(
                        mediaheight: mediaheight,
                        mediawidth: mediawidth,
                        userModel: state.user,
                        // currentuserModel: state.user,
                        // currentuserid: state.user.id!,
                      ),
                      CustomTabBar(
                        tabController: tabController,
                      ),
                      kheight5,
                      CustomTabView(
                        tabController: tabController,
                        userModel: state.user,
                      ),
                    ],
                  );
                } else if (state is UserProfileFetchServereErrorState) {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
