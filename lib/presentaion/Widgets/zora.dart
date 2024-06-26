import 'package:flutter/material.dart';

class MainHeading extends StatelessWidget {
  final String? heading;
  const MainHeading({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading!,
      style: const TextStyle(
          fontSize: 26.34, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
