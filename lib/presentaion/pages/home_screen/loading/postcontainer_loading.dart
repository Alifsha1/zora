import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';

class PostcontainerLoading extends StatefulWidget {
  const PostcontainerLoading({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
  });

  final double mediaheight;
  final double mediawidth;

  @override
  State<PostcontainerLoading> createState() => _PostcontainerLoadingState();
}

class _PostcontainerLoadingState extends State<PostcontainerLoading> {
  bool? isSaved;
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: shimmerGradient,
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: kgreyshimmer,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
