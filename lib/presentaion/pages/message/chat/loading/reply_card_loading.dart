import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/constants/contants.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';

class ReplyCardLoading extends StatelessWidget {
  const ReplyCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Shimmer(
            gradient: shimmerGradient,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 110,
              ),
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                // color: Theme.of(context).colorScheme.onPrimary,
                color: kgreyshimmer,
                //  boxShadow: kBoxShadow,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                'iiiiiiiiiiiii',
                style:  TextStyle(color: kgreyshimmer),
              ),
            ),
          ),
         // kWidth(8),
         kwidht10,
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              '',
             // DateFormat('h:mm:a').format(message.sendAt.toLocal()),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}