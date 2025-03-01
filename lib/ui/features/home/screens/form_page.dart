import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
import 'package:onah_portfolio/ui/shared/widgets/image_render_widget.dart';
import 'package:onah_portfolio/ui/shared/widgets/layout_constraint.dart';
import 'package:onah_portfolio/ui/shared/widgets/svg_render_widget.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutConstraint(
      padding: const EdgeInsets.symmetric(horizontal: 80).copyWith(right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const SvgRenderWidget(svgPath: SvgPath.formHeader),
          const SizedBox(height: 19),
          Row(
            children: [
              /// Form
              const Expanded(child: FormWidget()),
              const SizedBox(width: 80),

              Flexible(
                child: ImageRenderWidget.asset(imagePath: ImagePath.waveIllus),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(label: Text("First Name")),
              ),
            ),
            const SizedBox(width: 60),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Last Name"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(label: Text("Email")),
              ),
            ),
            const SizedBox(width: 60),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Country"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        TextFormField(
          decoration: const InputDecoration(labelText: "Message"),
          maxLines: 3,
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            context.showSuccessSnackBar("Message sent successfully");
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 0),
            padding: EdgeInsets.all(20)
          ),
          child: const ArrowText(child: Text("SEND MESSAGE")),
        ),
      ],
    );
  }
}
