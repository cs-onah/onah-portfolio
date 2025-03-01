import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/globals.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/screens/mobile_pages/mobile_tools_page.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
import 'package:onah_portfolio/ui/shared/widgets/image_render_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/layout_constraint.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.screenType.isMobile) return const MobileToolsPage();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImagePath.toolsBg))),
      child: LayoutConstraint(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const SvgRenderWidget(svgPath: SvgPath.toolsHeader),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ImageRenderWidget.asset(
                    imagePath: ImagePath.toolsIllus,
                  ),
                ),
                const SizedBox(width: 30),
                SizedBox(
                  width: context.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ToolTile(svg: SvgPath.flutter, title: "FLUTTER"),
                      const ToolTile(svg: SvgPath.dart, title: "DART"),
                      const ToolTile(
                        svg: SvgPath.android,
                        title: "ANDROID SDK",
                      ),
                      const ToolTile(
                        svg: SvgPath.ios,
                        title: "IOS DEVELOPMENT",
                      ),
                      const ToolTile(
                        svg: SvgPath.javascript,
                        title: "JAVASCRIPT",
                      ),
                      const SizedBox(height: 22),
                      Text(
                        "More Tools",
                        style: context.textTheme.displaySmall
                            ?.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "MacOS | Git | GitHub | Github Actions | "
                        "Google Cloud Services | Code Magic CI/CD | "
                        "BitBucket Pipelines | Google Play & AppStore App Versioning | "
                        "Postman/Swagger | Jira |  Payment Services Integration",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const SizedBox(height: 4),
                      Text(
                        "State Management/Concepts",
                        style: context.textTheme.displaySmall
                            ?.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Riverpod | Bloc | Provider | GetX | MobX | TDD | MVVM | SOLID | Clean",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () => launchUrl(Uri.parse(resumeUrl)),
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
