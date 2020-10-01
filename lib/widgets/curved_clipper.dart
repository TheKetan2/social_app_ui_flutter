import 'package:flutter/material.dart';

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);
    Offset point1 = Offset(size.width / 4, size.height);
    Offset point2 = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(point1.dx, point1.dy, point2.dx, point2.dy);
    Offset point3 = Offset(3 * size.width / 4, 3 * size.height / 5);
    Offset point4 = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(point3.dx, point3.dy, point4.dx, point4.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
    return false;
  }
}
