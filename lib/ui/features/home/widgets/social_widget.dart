import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double spacing = 30.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => open("https://www.linkedin.com/in/csonah"),
          child: const SvgRenderWidget(
            svgPath: SvgPath.linkedinMedia,
            height: 30,
          ),
        ),
        SizedBox(width: spacing),
        InkWell(
          onTap: () => open("https://www.tiktok.com/@cs_onah"),
          child: const SvgRenderWidget(
            svgPath: SvgPath.tiktokMedia,
            height: 30,
          ),
        ),
        SizedBox(width: spacing),
        InkWell(
          onTap: () => open("https://www.instagram.com/cs_onah"),
          child: const SvgRenderWidget(
            svgPath: SvgPath.instagramMedia,
            height: 30,
          ),
        ),
        SizedBox(width: spacing),
        InkWell(
          onTap: () => open("https://x.com/cs_onah"),
          child: const SvgRenderWidget(
            svgPath: SvgPath.twitterMedia,
            height: 30,
          ),
        ),
      ],
    );
  }

  open(String url) {
    launchUrl(Uri.parse(url));
  }
}
