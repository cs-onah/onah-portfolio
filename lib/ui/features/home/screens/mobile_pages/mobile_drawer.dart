import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  open(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full control over height
      backgroundColor: Colors.transparent, // Transparent background
      builder: (context) => const Align(
        alignment: Alignment.topCenter,
        child: MobileDrawer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const DrawerItem(title: "Blog"),
          const DrawerItem(title: "Resume"),
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
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const DrawerItem({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 19),
        Text(title ?? '', style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 10),
        const Divider(height: 1),
      ],
    );
  }
}
