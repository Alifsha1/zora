// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/user_profile/user_profile_bloc.dart';
import 'package:zora/presentaion/pages/edit_profile/edit_profile_page.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/account_info_post.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/custom_tabbar.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/custom_tabbarview.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/showing_profile_widget.dart';
import 'package:zora/presentaion/pages/settings/settings_page.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              BlocBuilder(
                bloc: context.read<UserProfileBloc>(),
                builder: (context, state) {
                  if (state is UserProfileSuccessfulState) {
                    print('${state.user.username}');
                    return Column(
                      children: [
                        ShowingProfileWidget(
                          userModel: state.user,
                        //  onprofile: true,
                         // isCurrentUser: false,
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          navigateedit: EditProfileScreen(user: state.user),
                          navigatesettings: SettingsScreen(),
                        ),
                        AccountInfoPost(
                            mediaheight: mediaheight, mediawidth: mediawidth),
                        CustomTabBar(
                          tabController: tabController,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomTabView(tabController: tabController),
                      ],
                    );
                  } else if (state is UserProfileFetchServereErrorState) {
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // return Center(
                  //   child: CircularProgressIndicator(),
                  // );
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
