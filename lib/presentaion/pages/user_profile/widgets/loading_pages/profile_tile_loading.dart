import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';

class ShowingProfileTileLoading extends StatelessWidget {
  const ShowingProfileTileLoading({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            right: 20,
            child: Icon(
              Customiconsflutter.settingline,
              size: 25,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 00,
            right: 0,
            left: 0,
            child: Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: mediaheight * .26,
                width: mediawidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kgreyshimmer,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: mediaheight * .16,
            right: mediawidth * .3,
            child: Shimmer(
              gradient: shimmerGradient,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 63,
                  backgroundColor: kgreyshimmer,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: mediaheight * .12),
                child: Shimmer(
                  gradient: shimmerGradient,
                  child: Container(
                    height: 23,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kgreyshimmer,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: mediaheight * .08),
                child: Shimmer(
                  gradient: shimmerGradient,
                  child: Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kgreyshimmer,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: mediaheight * .03,
            right: mediawidth * .59,

            child: Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                  color: kgreyshimmer,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            //  ),
          ),
          Positioned(
            bottom: mediaheight * .03,
            right: mediawidth * .19,
            child: Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                  color: kgreyshimmer,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
