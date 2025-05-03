import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/globals.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/utils/header_keys.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
import 'package:onah_portfolio/ui/features/home/widgets/custom_app_bar.dart';
import 'package:onah_portfolio/ui/features/home/widgets/social_widget.dart';
import 'package:onah_portfolio/ui/features/home/widgets/title_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/image_render_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/layout_constraint.dart';

class MobileFrontPage extends StatelessWidget {
  const MobileFrontPage({super.key});

  void goToPage(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const SizedBox(height: 46),

            /// Content
            const TitleWidget(),
            const SizedBox(height: 27),
            Text(
              tagLine,
              style: context.textTheme.bodyLarge?.copyWith(
                fontFamilyFallback: ['NotoColorEmoji'],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Center(child: SocialWidget()),
            const SizedBox(height: 30),
            ImageRenderWidget.asset(imagePath: ImagePath.avatar, width: 275),
            const SizedBox(width: 27),
            ElevatedButton(
              onPressed: () => goToPage(HeaderKey.formPage),
              child: const ArrowText(child: Text("HIRE ME")),
            ),
          ],
        ),
      ),
    );
  }
}
