import 'package:flutter/material.dart';
import 'package:zora/core/style/colors/colors.dart';

class MainHeading extends StatelessWidget {
  final String? heading;
  final Color? colorforheading;
  const MainHeading({super.key, required this.heading, this.colorforheading});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading!,
      style: TextStyle(
        fontSize: 26.34,
        fontWeight: FontWeight.bold,
        color: colorforheading ?? kblack,
      ),
    );
  }
}

class Maintitle extends StatelessWidget {
  final String? heading;
  final Color? colorforheading;
  const Maintitle({super.key, required this.heading, this.colorforheading});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading!,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: colorforheading ?? kblack,
      ),
    );
  }
}
