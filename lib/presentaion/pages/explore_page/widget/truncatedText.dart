import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

class Truncatedtext extends StatelessWidget {
  final String? bio;
  

 const Truncatedtext({super.key, this.bio});

  @override
  Widget build(BuildContext context) {
    final String displayText = (bio == null || bio!.isEmpty) ? 'bio' : bio!;
    final bool isLongText = displayText.length > 10;
    final String truncatedText = isLongText ? displayText.substring(0, 10) : displayText;

    return Text.rich(
      TextSpan(
        text: truncatedText,
        style: const TextStyle(
          color:  kblack,
          fontWeight: FontWeight.normal,
          fontFamily: "Quick_sand",
        ),
        children: isLongText
            ? [
                TextSpan(
                  text: '...',
                  style: TextStyle(
                    color: kgrey,
                  ),
                ),
              ]
            : [],
      ),
    );
  }
}
