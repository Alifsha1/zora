import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';

class UserbyIdLoading extends StatefulWidget {
  final double mediaheight;
  final double mediawidth;
  
 const UserbyIdLoading({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
  
  });

  @override
  State<UserbyIdLoading> createState() => _UserbyIdLoadingState();
}

class _UserbyIdLoadingState extends State<UserbyIdLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mediaheight * 0.07,
      width: widget.mediawidth * 0.4,
      decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(.5),
          borderRadius: BorderRadius.circular(30)),
      child: const Padding(
        padding: EdgeInsets.all(7.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/placeholderimage.jpg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 '_____',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                 '____',
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
