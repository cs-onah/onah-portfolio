import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child:
                      ImageRenderWidget.asset(imagePath: ImagePath.toolsIllus)),
              const SizedBox(width: 30),
              SizedBox(
                width: context.width * 0.3,
                child: Column(
                  children: [
                    const ToolTile(svg: SvgPath.flutter, title: "FLUTTER"),
                    const ToolTile(svg: SvgPath.dart, title: "DART"),
                    const ToolTile(svg: SvgPath.android, title: "ANDROID SDK"),
                    const ToolTile(svg: SvgPath.ios, title: "IOS DEVELOPMENT"),
                    const ToolTile(svg: SvgPath.javascript, title: "JAVASCRIPT"),
                    const SizedBox(height: 22),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 0),
                        padding: const EdgeInsets.all(18),
                      ),
                      child: const ArrowText(
                        child: Text(
                          "DOWNLOAD RESUME",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ToolTile extends StatelessWidget {
  final String svg;
  final String title;
  const ToolTile({super.key, required this.svg, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 22),
        Row(
          children: [
            SvgRenderWidget(svgPath: svg),
            const SizedBox(width: 20),
            Expanded(child: Text(title, style: context.textTheme.bodyLarge)),
          ],
        ),
        const SizedBox(height: 15),
        const Divider(height: 1),
      ],
    );
  }
}
