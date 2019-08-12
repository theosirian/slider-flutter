import 'dart:math';

import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {
  final double clipFactor;

  DiagonalClipper(this.clipFactor);

  @override
  Path getClip(Size size) {
    final dist = sqrt(size.width * size.width + size.height * size.height);
    final clipped = dist * clipFactor;
    final sin = dist / size.width;
    final cos = dist / size.height;
    final width = sin * clipped;
    final height = cos * clipped;

    Path path = Path();
    path.lineTo(width, 0.0);
    path.lineTo(0.0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
