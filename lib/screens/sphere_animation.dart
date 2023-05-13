import 'package:flutter/material.dart';

enum CirlcleSide { right, left }

extension ToPath on CirlcleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CirlcleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;

        break;
      case CirlcleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }

    path.arcToPoint(offset,
        radius: Radius.elliptical(size.width / 2, size.height / 2),
        clockwise: clockwise);
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  CirlcleSide side;
  HalfCircleClipper({required this.side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class Sphere extends StatefulWidget {
  const Sphere({super.key});

  @override
  State<Sphere> createState() => _SphereState();
}

class _SphereState extends State<Sphere> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: HalfCircleClipper(side: CirlcleSide.left),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                ),
              ),
              ClipPath(
                clipper: HalfCircleClipper(side: CirlcleSide.right),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
