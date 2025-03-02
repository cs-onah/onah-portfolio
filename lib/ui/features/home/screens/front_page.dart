import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/screens/mobile_pages/mobile_front_page.dart';
import 'package:onah_portfolio/ui/features/home/utils/header_keys.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
import 'package:onah_portfolio/ui/features/home/widgets/custom_app_bar.dart';
import 'package:onah_portfolio/ui/shared/widgets/image_render_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/layout_constraint.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  void goToPage(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (context.screenType.isMobileOrTablet) return const MobileFrontPage();

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
                        onPressed: () => goToPage(HeaderKey.formPage),
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

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  static const List<String> roles = [
    'Mobile Software Developer',
    'IT Project Manager',
  ];

  @override
  Widget build(BuildContext context) {
    const speed = Duration(milliseconds: 100);
    final alignment = context.screenType.isMobileOrTablet
        ? TextAlign.center
        : TextAlign.start;
    final style = context.textTheme.displayMedium!;
    return DefaultTextStyle(
      style: style,
      textAlign: alignment,

      /// Layout builder is used to estimate size of text, and fix text height
      /// To avoid up and down behavior caused by [TypewriterAnimatedText]
      child: LayoutBuilder(builder: (context, constraints) {
        double estimatedHeight = _calculateTextHeight(
          context,
          roles[0],
          style,
          constraints.maxWidth,
        );
        return SizedBox(
          height: estimatedHeight,
          child: AnimatedTextKit(
            animatedTexts: roles.map((role) {
              return TypewriterAnimatedText(
                role,
                speed: speed,
                textAlign: alignment,
              );
            }).toList(),
          ),
        );
      }),
    );
  }

  double _calculateTextHeight(
    BuildContext context,
    String text,
    TextStyle style,
    double maxWidth,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: null, // Allow multiple lines
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth); // Compute wrapping
    return textPainter.size.height; // Return calculated height
  }
}
