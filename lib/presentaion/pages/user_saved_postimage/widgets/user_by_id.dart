import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

// ignore: must_be_immutable
class UserByIdName extends StatefulWidget {
  final double mediaheight;
  final double mediawidth;
  ImageProvider<Object>? backgroundImage;
  final String username;
  final String time;
  UserByIdName({
    super.key,
    required this.mediaheight,
    required this.mediawidth,
    required this.backgroundImage,
    required this.username,
    required this.time,
  });

  @override
  State<UserByIdName> createState() => _UserByIdNameState();
}

class _UserByIdNameState extends State<UserByIdName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mediaheight * 0.07,
      width: widget.mediawidth * 0.4,
      decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(.5),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Colors.white,
              backgroundImage: widget.backgroundImage,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.username,
                  style: const TextStyle(
                    color: kwhite,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.time,
                  style: const TextStyle(
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
