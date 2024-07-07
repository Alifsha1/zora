import 'package:flutter/material.dart';

const shimmerGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    Color.fromARGB(255, 188, 230, 244),
    Color.fromARGB(255, 180, 225, 243),
    Color.fromARGB(255, 176, 231, 239),
    Color.fromARGB(255, 188, 230, 244),
    Color.fromARGB(255, 188, 230, 244),
  ],
  stops: <double>[0.0, 0.35, 0.5, 0.65, 1.0],
);
