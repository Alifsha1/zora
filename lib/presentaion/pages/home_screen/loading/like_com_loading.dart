
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/presentaion/pages/home_screen/loading/com_loading.dart';

class LikeComLoading extends StatefulWidget {
  const LikeComLoading({
    super.key,
  });

  @override
  State<LikeComLoading> createState() => _LikeComLoadingState();
}

class _LikeComLoadingState extends State<LikeComLoading> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onDoubleTap: () {},
                          child: const Icon(
                            CupertinoIcons.heart,
                            size: 25,
                            color: kwhite,
                          ),
                        ),
                        Text(
                          'No Likes',
                          style: const TextStyle(
                            color: kwhite,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              kwidht10,
              const ComLoading(),
            ],
          ),
        ],
      ),
    );
  }
}
