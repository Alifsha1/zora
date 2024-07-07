import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/tab_items.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
  });
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.transparent,
        ),
        child: TabBar(
          indicatorColor: kblack,
          labelColor: Colors.black,
          controller: tabController,
          tabs: const [
            TabItems(
              icons: FeatherIcons.grid,
            ),
            TabItems(icons: FeatherIcons.bookmark),
          ],
        ),
      ),
    );
  }
}
