import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

class ContainerSlideSec extends StatelessWidget {
  final IconData iconsright;
  final IconData iconsleft;
  final String title;

  const ContainerSlideSec({
    super.key,
    required this.mediaheight,
    required this.iconsright,
    required this.iconsleft,
    required this.title,
  });

  final double mediaheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaheight * .07,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              iconsright,
              size: 33,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: "Quick_sand",
                    fontWeight: FontWeight.normal,
                    color: kblack,
                    fontSize: 17),
              ),
            ),
            const Spacer(),
            Icon(iconsleft)
          ],
        ),
      ),
    );
  }
}
