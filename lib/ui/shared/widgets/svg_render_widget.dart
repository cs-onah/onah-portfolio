import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Renders and svg asset given a [svgPath]
class SvgRenderWidget extends StatelessWidget {
  final String svgPath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const SvgRenderWidget({
    super.key,
    this.width,
    this.height,
    this.color,
    required this.svgPath, this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      color: color,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
    );
  }
}
