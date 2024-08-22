import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';

class MessageListLoading extends StatefulWidget {
  const MessageListLoading({super.key});

  @override
  State<MessageListLoading> createState() => _MessageListLoadingState();
}

class _MessageListLoadingState extends State<MessageListLoading> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Shimmer(
        gradient: shimmerGradient,
        child: CircleAvatar(
          radius: 25,
        backgroundColor: kgreyshimmer,
        ),
      ),
      title: Shimmer(
        gradient: shimmerGradient,
        child: Container(
          color: kgreyshimmer,
          child: const Text(
           '',
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
            maxLines: 1,
          ),
        ),
      ),
      minVerticalPadding: 18,
      subtitle: Shimmer(
        gradient: shimmerGradient,
        child: Container(
          color: kgreyshimmer,
          child: Text(
            '',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
      
    );
  }
}