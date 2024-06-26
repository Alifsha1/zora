import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/presentaion/Widgets/container_slide_sec.dart';
import 'package:zora/presentaion/Widgets/zora.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    //final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                MainHeading(heading: 'Admin'),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(FeatherIcons.logOut))
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 15),
                  child: ContainerSlideSec(
                    mediaheight: mediaheight,
                    iconsright: Customiconsflutter.group,
                    iconsleft: Icons.keyboard_arrow_right,
                    title: 'User Management',
                  ),
                ),
                ContainerSlideSec(
                  mediaheight: mediaheight,
                  iconsright: FeatherIcons.tool,
                  iconsleft: Icons.keyboard_arrow_right,
                  title: 'User Management',
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
