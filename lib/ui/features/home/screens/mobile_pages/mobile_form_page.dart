import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/ui/features/home/screens/form_page.dart';
import 'package:onah_portfolio/ui/shared/widgets/layout_constraint.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';

class MobileFormPage extends StatelessWidget {
  const MobileFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutConstraint(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          SvgRenderWidget(svgPath: SvgPath.formHeader),
          SizedBox(height: 19),
          FormWidget(),
        ],
      ),
    );
  }
}