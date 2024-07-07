import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/custom_tabbar.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/loading_pages/acountinfo_loading.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/loading_pages/post_grid_loading.dart';
import 'package:zora/presentaion/pages/user_profile/widgets/loading_pages/profile_tile_loading.dart';

class ProfileLoading extends StatefulWidget {
  final double mediaheight;
  final double mediawidth;
  const ProfileLoading(
      {super.key, required this.mediaheight, required this.mediawidth});

  @override
  State<ProfileLoading> createState() => _ProfileLoadingState();
}

// final  TabController tabController = TabController(length: 2, vsync: this);

class _ProfileLoadingState extends State<ProfileLoading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              ShowingProfileTileLoading(
                  mediaheight: widget.mediaheight,
                  mediawidth: widget.mediawidth),
              //     SizedBox(
              //       height: 400,
              //       child: Stack(
              //         children: [
              //           const Positioned(
              //             top: 10,
              //             right: 20,
              //             child: Icon(
              //               Customiconsflutter.setting_line,
              //               size: 25,
              //               color: Colors.white,
              //             ),
              //           ),
              //           Positioned(
              //             top: 0,
              //             right: 0,
              //             left: 0,
              //             child: Shimmer(
              //               gradient: shimmerGradient,
              //               child: Container(
              //                 height: widget.mediaheight * .26,
              //                 width: widget.mediawidth,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(40),
              //                   color: kgreyshimmer,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Positioned(
              //             bottom: widget.mediaheight * .16,
              //             right: widget.mediawidth * .3,
              //             child: Shimmer(
              //               gradient: shimmerGradient,
              //               child: CircleAvatar(
              //                 radius: 70,
              //                 backgroundColor: Colors.white,
              //                 child: CircleAvatar(
              //                   radius: 63,
              //                   backgroundColor: kgreyshimmer,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Positioned.fill(
              //             child: Align(
              //               alignment: Alignment.bottomCenter,
              //               child: Padding(
              //                 padding:
              //                     EdgeInsets.only(bottom: widget.mediaheight * .12),
              //                 child: Shimmer(
              //                   gradient: shimmerGradient,
              //                   child: Container(
              //                     height: 23,
              //                     width: 120,
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(40),
              //                       color: kgreyshimmer,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Positioned.fill(
              //             child: Align(
              //               alignment: Alignment.bottomCenter,
              //               child: Padding(
              //                 padding:
              //                     EdgeInsets.only(bottom: widget.mediaheight * .08),
              //                 child: Shimmer(
              //                   gradient: shimmerGradient,
              //                   child: Container(
              //                     height: 20,
              //                     width: 80,
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(40),
              //                       color: kgreyshimmer,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Positioned(
              //             bottom: widget.mediaheight * .03,
              //             right: widget.mediawidth * .59,

              //             child: Shimmer(
              //               gradient: shimmerGradient,
              //               child: Container(
              //                 height: 25,
              //                 width: 80,
              //                 decoration: BoxDecoration(
              //                   color: kgreyshimmer,
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //               ),
              //             ),
              //             //  ),
              //           ),
              //           Positioned(
              //             bottom: widget.mediaheight * .03,
              //             right: widget.mediawidth * .19,
              //             child: Shimmer(
              //               gradient: shimmerGradient,
              //               child: Container(
              //                 height: 25,
              //                 width: 80,
              //                 decoration: BoxDecoration(
              //                   color: kgreyshimmer,
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //     ),

              AccountInfoLoadingTile(
                  mediaheight: widget.mediaheight,
                  mediawidth: widget.mediawidth),

              SizedBox(
                height: 5,
              ),
              PostGridLoading(),
            ],
          ),
        ],
      ),
    );
  }
}
