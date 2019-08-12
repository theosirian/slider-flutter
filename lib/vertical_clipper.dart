import 'package:flutter/material.dart';

class VerticalClipper extends CustomClipper<Path> {
  final double clipFactor;

  VerticalClipper(this.clipFactor);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height * clipFactor);
    path.lineTo(0.0, size.height * clipFactor);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
