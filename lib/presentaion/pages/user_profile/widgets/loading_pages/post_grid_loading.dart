import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';

class PostGridLoading extends StatefulWidget {
  const PostGridLoading({super.key});

  @override
  State<PostGridLoading> createState() => _PostGridLoadingState();
}

class _PostGridLoadingState extends State<PostGridLoading> {
  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: [
            Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(color: kgreyshimmer
                    // color: Colors.amber,
                    ),
              ),
            ),
            Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(color: kgreyshimmer
                    // color: Colors.amber,
                    ),
              ),
            ),
            Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(color: kgreyshimmer
                    // color: Colors.amber,
                    ),
              ),
            ),
            Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(color: kgreyshimmer
                    // color: Colors.amber,
                    ),
              ),
            ),
            Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(color: kgreyshimmer
                    // color: Colors.amber,
                    ),
              ),
            ),
            Shimmer(
              gradient: shimmerGradient,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(color: kgreyshimmer
                    // color: Colors.amber,
                    ),
              ),
            ),
          ]),
    );
  }
}
