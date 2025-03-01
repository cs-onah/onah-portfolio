import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';

class LayoutConstraint extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const LayoutConstraint({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final defaultPadding = context.screenType.isMobile
        ? const EdgeInsets.symmetric(horizontal: 32)
        : const EdgeInsets.symmetric(horizontal: 80);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1440),
      child: Padding(
        padding: padding ?? defaultPadding,
        child: child,
      ),
    );
  }
}
