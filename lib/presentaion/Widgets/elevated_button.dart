import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

class Buttonelevated extends StatelessWidget {
  final void Function()? onPressed;
  final String buttontext;
  const Buttonelevated({
    super.key,
    required this.mediawidth,
    required this.buttontext,
    this.onPressed,
  });

  final double mediawidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediawidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: kblack,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        child: Text(
          buttontext,
          style: const TextStyle(
              fontFamily: "Quick_sand",
              fontWeight: FontWeight.w600,
              color: kwhite),
        ),
      ),
    );
  }
}
