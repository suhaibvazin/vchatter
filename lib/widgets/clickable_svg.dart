import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClickableSvg extends StatelessWidget {
  final String imagePath;
  final void Function()? onTap;
  final double height;
  const ClickableSvg({
    super.key,
    required this.imagePath,
    this.onTap,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: height,
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          imagePath,
        ),
      ),
    );
  }
}
