import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/globals.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';
import 'package:onah_portfolio/ui/themes/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.screenType.isMobile;
    return Row(
      children: [
        SvgRenderWidget(svgPath: SvgPath.logo, width: isMobile ? 80 : null),
        const Spacer(),
        if (isMobile) ...[
          InkWell(
            onTap: () {}, // open drawer
            child: const SvgRenderWidget(svgPath: SvgPath.hamburger),
          ),
        ] else ...[
          // nav options
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("My Project"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Tools"),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("Blog"),
              ),
              TextButton(
                onPressed: () => launchUrl(Uri.parse(resumeUrl)),
                child: const Text("Resume"),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(18),
            ),
            child: const ArrowText(
              child: Text(
                "HIRE ME",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppFont.cormorantInfant,
                ),
              ),
            ),
          )
        ]
      ],
    );
  }
}
