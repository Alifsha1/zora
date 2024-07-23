import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:zora/presentaion/Widgets/zora.dart';
import 'package:zora/presentaion/pages/home_screen/sections/post_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// late final controller = SlidableController(this);
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverAppBar(
          leading: const SizedBox(),
          backgroundColor: const Color.fromARGB(255, 228, 246, 246),
          centerTitle: true,
          title: const MainHeading(heading: 'Zora...'),
          expandedHeight: 70,
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FeatherIcons.bell,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FeatherIcons.messageCircle,
                      color: Colors.black,
                    ))
              ],
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child:
                PostSection(mediaheight: mediaheight, mediawidth: mediawidth),
          ),
        ),
      ],
    ));
  }
}
