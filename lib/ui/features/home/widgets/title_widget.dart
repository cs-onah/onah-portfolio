import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({super.key});
  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  List<String> roles = const [
    'Mobile Software Developer',
    'IT Project Manager',
  ];

  final controller = AnimatedTextController();
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
            controller: controller,
            onFinished: () => controller.reset(),
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
