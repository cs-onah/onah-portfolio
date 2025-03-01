import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';

enum SnackBarType { success, warning, error }

class AppSnackBar extends StatelessWidget {
  final String? title;
  final String? caption;
  final bool showClose;
  final SnackBarType type;
  const AppSnackBar({
    super.key,
    this.title,
    this.caption,
    this.showClose = true,
    this.type = SnackBarType.success,
  });

  @override
  Widget build(BuildContext context) {
    final color = switch (type) {
      SnackBarType.success => Color(0xff04802E),
      SnackBarType.warning => Color(0xffDD900D),
      SnackBarType.error => Color(0xffCB1A14),
    };
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: context.theme.dividerColor),
        color: context.cardColor,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(4),
                ),
                color: color,
              ),
            ),
            const SizedBox(width: 16),
            switch (type) {
              SnackBarType.success =>
                SvgRenderWidget(svgPath: SvgPath.snackSuccess),
              SnackBarType.warning =>
                SvgRenderWidget(svgPath: SvgPath.snackWarning),
              SnackBarType.error =>
                SvgRenderWidget(svgPath: SvgPath.snackError),
            },
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(
                          "$title",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    Text(caption ?? "")
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            if (showClose) ...[
              VerticalDivider(indent: 4, endIndent: 4),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                icon: Icon(Icons.close),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
