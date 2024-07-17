import 'package:flutter/material.dart';

class TabItems extends StatelessWidget {
  final IconData icons;
  const TabItems({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Center(
        child: Icon(icons),
      ),
    );
  }
}
