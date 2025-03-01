import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
import 'package:onah_portfolio/ui/shared/widgets/image_render_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/layout_constraint.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';
import 'package:onah_portfolio/ui/themes/theme.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePath.homeBg),
          fit: BoxFit.cover,
        ),
      ),
      child: LayoutConstraint(
        child: Column(
          children: [
            const SizedBox(height: 39),

            /// App Bar
            const CustomAppBar(),
            const Spacer(),

            /// Content
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleWidget(),
                      const SizedBox(height: 27),
                      Text(
                        "Hi! I’m Ebuka, a Mobile Developer based in Nigeria. "
                        "I create user-friendly interfaces for fast-growing startups.",
                        style: context.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 27),
                      ElevatedButton(
                        onPressed: () {},
                        child: const ArrowText(child: Text("HIRE ME")),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 80),
                ImageRenderWidget.asset(imagePath: ImagePath.avatar),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SvgRenderWidget(svgPath: SvgPath.logo),
        const Spacer(),

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
              onPressed: () {},
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
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    const speed = Duration(milliseconds: 100);
    return DefaultTextStyle(
      style: context.textTheme.displayMedium!,
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText('Mobile Software Developer', speed: speed),
          TypewriterAnimatedText('IT Project Manager', speed: speed),
        ],
      ),
    );
  }
}
