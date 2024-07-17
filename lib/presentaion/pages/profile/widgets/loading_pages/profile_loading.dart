import 'package:flutter/material.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/presentaion/pages/profile/widgets/loading_pages/acountinfo_loading.dart';
import 'package:zora/presentaion/pages/profile/widgets/loading_pages/post_grid_loading.dart';
import 'package:zora/presentaion/pages/profile/widgets/loading_pages/profile_tile_loading.dart';

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
        

              AccountInfoLoadingTile(
                  mediaheight: widget.mediaheight,
                  mediawidth: widget.mediawidth),

              kheight5,
              const PostGridLoading(),
            ],
          ),
        ],
      ),
    );
  }
}
