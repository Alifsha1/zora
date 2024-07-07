import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';

class AccountInfoLoadingTile extends StatelessWidget {
  const AccountInfoLoadingTile({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  height: 20,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: kgreyshimmer,
                  ),
                ),
              ),
              Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  height: 20,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: kgreyshimmer,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: mediaheight * .08,
            width: mediawidth * 0.01,
            child: const VerticalDivider(
              width: 10,
              thickness: 2,
              color: Colors.grey,
              endIndent: 10,
              indent: 1,
            ),
          ),
          Column(
            children: [
              Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  height: 20,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: kgreyshimmer,
                  ),
                ),
              ),
              Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  height: 20,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: kgreyshimmer,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: mediaheight * .08,
            width: mediawidth * 0.01,
            child: const VerticalDivider(
              width: 10,
              thickness: 2,
              color: Colors.grey,
              endIndent: 10,
              indent: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Shimmer(
                  gradient: shimmerGradient,
                  child: Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kgreyshimmer,
                    ),
                  ),
                ),
                Shimmer(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
