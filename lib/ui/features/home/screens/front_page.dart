import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/globals.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/screens/mobile_pages/mobile_front_page.dart';
import 'package:onah_portfolio/ui/features/home/utils/header_keys.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
import 'package:onah_portfolio/ui/features/home/widgets/custom_app_bar.dart';
import 'package:onah_portfolio/ui/features/home/widgets/social_widget.dart';
import 'package:onah_portfolio/ui/features/home/widgets/title_widget.dart';
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
      width: double.infinity,
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
                        tagLine,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontFamilyFallback: ['NotoColorEmoji'],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SocialWidget(),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () => goToPage(HeaderKey.formPage),
                        child: const ArrowText(child: Text("CONTACT ME")),
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
