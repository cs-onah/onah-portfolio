import 'package:flutter/material.dart';

class SpacedRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  const SpacedRow({
    super.key,
    required this.children,
    this.spacing = 8.0, // Default spacing
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _buildSpacedChildren(),
    );
  }

  List<Widget> _buildSpacedChildren() {
    if (children.isEmpty) return [];

    List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);

      // Add spacing except after the last item
      if (i < children.length - 1) {
        spacedChildren.add(SizedBox(width: spacing));
      }
    }
    return spacedChildren;
  }
}
