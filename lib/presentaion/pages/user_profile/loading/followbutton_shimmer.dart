import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';

class FollowbuttonShimmer extends StatefulWidget {

  final double? mediawidth;

  const FollowbuttonShimmer({
    super.key,
     this.mediawidth,

  });

  @override
  State<FollowbuttonShimmer> createState() => _FollowbuttonShimmerState();
}

class _FollowbuttonShimmerState extends State<FollowbuttonShimmer> {
 
  

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: [
          Shimmer(
            gradient: shimmerGradient,
            child: Container(
             // width: widget.mediawidth! / 2.15,
             width: 80,
             height: 30,
              decoration: BoxDecoration(
                color: kgreyshimmer,
                borderRadius: BorderRadius.circular(10),
              ),
           
            ),
          ),
         
        ],
      ),
    );
  }
}
