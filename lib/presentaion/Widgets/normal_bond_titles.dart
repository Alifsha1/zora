import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

class NormalBondTitles extends StatelessWidget {
  final String titles;
  final Color? color;
  const NormalBondTitles({
    super.key,
    required this.titles,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titles,
      style: TextStyle(
          color: color ?? kblack,
          fontWeight: FontWeight.normal,
          fontFamily: "Quick_sand"),
    );
  }
}

class BoldTitles extends StatelessWidget {
  final String titles;
  final Color? color;
  final double fontsize;
  const BoldTitles({
    super.key,
    required this.titles,
    this.color,
    required this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titles,
      style: TextStyle(
          color: color ?? kblack,
          fontWeight: FontWeight.bold,
          fontFamily: "Quick_sand",
          fontSize: fontsize),
    );
  }
}
