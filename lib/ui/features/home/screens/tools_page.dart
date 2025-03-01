import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/ui/shared/widgets/image_render_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/layout_constraint.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutConstraint(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const SvgRenderWidget(svgPath: SvgPath.projectHeader),
          Row(
            children: [
              ImageRenderWidget.asset(imagePath: ImagePath.toolsIllus),
              const SizedBox(width: 200),


            ],
          )
        ],
      ),
    );
  }
}
