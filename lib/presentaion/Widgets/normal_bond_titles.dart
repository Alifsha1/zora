import 'package:flutter/material.dart';

class NormalBondTitles extends StatelessWidget {
  final String titles;
  const NormalBondTitles({
    super.key, required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titles,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontFamily: "Quick_sand"),
    );
  }
}