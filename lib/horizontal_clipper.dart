import 'package:flutter/material.dart';

class HorizontalClipper extends CustomClipper<Path> {
  final double clipFactor;

  HorizontalClipper(this.clipFactor);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * clipFactor, 0.0);
    path.lineTo(size.width * clipFactor, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
