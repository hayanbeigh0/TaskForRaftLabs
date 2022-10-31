import 'package:flutter/material.dart';

class VerticalCardSpacing extends StatelessWidget {
  const VerticalCardSpacing({super.key, this.spacing = 5.0});
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacing,
    );
  }
}
