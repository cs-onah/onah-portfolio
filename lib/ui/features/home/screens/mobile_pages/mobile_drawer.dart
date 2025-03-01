import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/globals.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  open(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true, // Allows tapping outside to close
      barrierLabel: "Top Drawer",
      transitionDuration: Duration(milliseconds: 300), // Animation speed
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.topCenter,
          child: MobileDrawer(),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -1), // Starts from the top (-1 means above screen)
            end: Offset(0, 0), // Ends at its normal position
          ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeInOut)),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: context.scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.close, size: 30),
                onPressed: context.pop,
              ),
            ),
            const DrawerItem(title: "My Projects"),
            const DrawerItem(title: "Tools"),
            DrawerItem(
              title: "Blog",
              onTap: () => launchUrl(Uri.parse(blogUrl)),
            ),
            DrawerItem(
              title: "Resume",
              onTap: () => launchUrl(Uri.parse(resumeUrl)),
            ),
            const SizedBox(height: 38),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const ArrowText(child: Text("HIRE ME")),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const DrawerItem({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 19),
          Text(title ?? '', style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 10),
          const Divider(height: 1),
        ],
      ),
    );
  }
}
