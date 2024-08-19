import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zora/core/constants/contants.dart';
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

class CustomSettingButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttontext;
  final double mediawidth;
  final double mediaheight;
  final IconData? prefixicon;
  final Color? color;
  const CustomSettingButton({
    super.key,
    required this.mediawidth,
    required this.mediaheight,
    required this.buttontext,
    this.onPressed,
    this.prefixicon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      width: mediawidth,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: kwhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Row(
          children: [
            Row(
              children: [
                prefixicon != null
                    ? Icon(
                        prefixicon,
                        color: kblack,
                      )
                    : const SizedBox(),
                kwidht30,
                Text(
                  buttontext,
                  style: TextStyle(
                      fontFamily: "Quick_sand",
                      fontWeight: FontWeight.w600,
                      color: color ?? kblack),
                ),
              ],
            ),
            const Spacer(),
            const Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: kblack,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
