import 'package:flutter/material.dart';

class ClickableLinks extends StatelessWidget {
  final void Function()? onTap;
  final String linkText;
  const ClickableLinks({
    super.key,
    this.onTap,
    required this.linkText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(linkText),
    );
  }
}
