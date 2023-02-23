import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Glass_card extends StatelessWidget {
  final double height, width, borderRadius;
  final List<Color> gredientColor;
  final Color borderColor;
  final Widget? child;
  const Glass_card({
    super.key,
    required this.height,
    required this.width,
    this.gredientColor = const [Colors.white60, Colors.white10],
    this.borderRadius = 25,
    this.borderColor = Colors.white,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: Get.width < 720 ? width : width / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
          child: Container(
            padding: EdgeInsets.all(5),
            height: height,
            width: Get.width < 720 ? width : width / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gredientColor,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor,
                width: 2.0,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
