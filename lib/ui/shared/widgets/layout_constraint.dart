import 'package:flutter/material.dart';

class LayoutConstraint extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const LayoutConstraint({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1440),
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 80),
        child: child,
      ),
    );
  }
}
