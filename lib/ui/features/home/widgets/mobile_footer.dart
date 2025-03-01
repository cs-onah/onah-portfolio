import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/shared/widgets/layout_constraint.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';
import 'package:onah_portfolio/ui/themes/theme.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.cardColor,
      child: LayoutConstraint(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Row(),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Built with Flutter",
                  style: TextStyle(
                    fontFamily: AppFont.aeonik,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 6),
                SvgRenderWidget(svgPath: SvgPath.flutterSmall),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "${DateTime.now().year} Copyright© reserved.",
              style: const TextStyle(
                fontFamily: AppFont.aeonik,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
