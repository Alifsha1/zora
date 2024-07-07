import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/post_view.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/saved_grid_view.dart';

class CustomTabView extends StatelessWidget {
  final UserModel? userModel;
  final TabController tabController;
  const CustomTabView(
      {super.key, required this.tabController, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return AutoScaleTabBarView(
      controller: tabController,
      children: [
        PostGridView(
          userModel: userModel,
        ),
        SavedGridView(
          userModel: userModel,
        ),
      ],
    );
  }
}
