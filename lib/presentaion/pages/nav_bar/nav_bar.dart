// import 'package:feather_icons/feather_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:zora/core/icons/customiconsflutter_icons.dart';
// import 'package:zora/presentaion/pages/explore_page/explore_page.dart';
// import 'package:zora/presentaion/pages/home_screen/home_screen.dart';
// import 'package:zora/presentaion/pages/post_add_page/post_add_page.dart';
// import 'package:zora/presentaion/pages/profile/profile_screen.dart';

// class CustomNavBar extends StatefulWidget {
//   const CustomNavBar({super.key});

//   @override
//   State<CustomNavBar> createState() => _CustomNavBarState();
// }

// class _CustomNavBarState extends State<CustomNavBar> {
//   List<dynamic> pages = [
//     HomeScreen(),
//     ExploreScreen(),
//     PostAddScreen(),
//     ProfileScreen()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: ValueListenableBuilder<int>(
//         valueListenable: indexchangenotifier,
//         builder: (context, index, child) {
//           return pages[index];
//         },
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
//         child: Container(
//           height: 60,
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.transparent.withOpacity(.5),
//             borderRadius: BorderRadius.all(
//               Radius.circular(30),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   indexchangenotifier.value = 0;
//                 },
//                 icon: Icon(
//                   FeatherIcons.home,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   indexchangenotifier.value = 1;
//                 },
//                 icon: Icon(
//                   FeatherIcons.compass,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   indexchangenotifier.value = 2;
//                 },
//                 icon: Icon(
//                   FeatherIcons.plusCircle,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   indexchangenotifier.value = 3;
//                 },
//                 icon: Icon(
//                   Icons.person_outline,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ValueNotifier<int> indexchangenotifier = ValueNotifier<int>(0);
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:zora/presentaion/pages/explore_page/explore_page.dart';
import 'package:zora/presentaion/pages/home_screen/home_screen.dart';
import 'package:zora/presentaion/pages/post_add_page/post_add_page.dart';
import 'package:zora/presentaion/pages/user_profile/profile_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  List<dynamic> pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const PostAddScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ValueListenableBuilder<int>(
        valueListenable: indexChangeNotifier,
        builder: (context, index, child) {
          return pages[index];
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60, bottom: 20),
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildIconButton(0, FeatherIcons.home),
              _buildIconButton(1, FeatherIcons.compass),
              _buildIconButton(2, FeatherIcons.plusCircle),
              _buildIconButton(3, Icons.person_outline),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(int index, IconData icon) {
   // bool isSelected = indexChangeNotifier.value == index;

    return ValueListenableBuilder<int>(
      valueListenable: indexChangeNotifier,
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            indexChangeNotifier.value = index;
          },
          child: Container(
            decoration: indexChangeNotifier.value == index
                ? const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  )
                : null,
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: indexChangeNotifier.value == index
                  ? Colors.black
                  : Colors.white,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}

ValueNotifier<int> indexChangeNotifier = ValueNotifier<int>(0);
