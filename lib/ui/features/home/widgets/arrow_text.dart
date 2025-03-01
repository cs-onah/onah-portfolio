import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';

class ArrowText extends StatelessWidget {
  final Widget child;
  const ArrowText({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: child),
        const SizedBox(width: 25),
        const SvgRenderWidget(svgPath: SvgPath.arrowRight),
      ],
    );
  }
}
