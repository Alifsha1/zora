
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zora/core/style/colors/colors.dart';




class ComLoading extends StatefulWidget {
  
  const ComLoading({super.key,});

  @override
  State<ComLoading> createState() => _ComLoadingState();
}

class _ComLoadingState extends State<ComLoading>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
           
          },
          child: const Icon(
            FeatherIcons.messageCircle,
            size: 25,
            color: kwhite,
          ),
        ),
        const Text(
        'No Comments',
           
          style: TextStyle(
            color: kwhite,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

 
}
