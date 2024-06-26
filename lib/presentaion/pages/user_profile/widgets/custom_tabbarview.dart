import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/post_view.dart';

class CustomTabView extends StatelessWidget {
  final TabController tabController;
  const CustomTabView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return AutoScaleTabBarView(
      controller: tabController,
      children: [
        PostGridView(),
        PostGridView(),
      ],
    );
  }
}
