import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/constants/image_paths.dart';
import 'package:onah_portfolio/core/constants/svg_path.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/core/utils/validators.dart';
import 'package:onah_portfolio/ui/features/home/widgets/arrow_text.dart';
import 'package:onah_portfolio/ui/shared/widgets/app_elevated_button.dart';
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

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> with Validators {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final country = TextEditingController();
  final message = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstName,
                  validator: validateName,
                  decoration: const InputDecoration(label: Text("First Name *")),
                ),
              ),
              const SizedBox(width: 60),
              Expanded(
                child: TextFormField(
                  controller: lastName,
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
                  controller: email,
                  validator: validateEmail,
                  decoration: const InputDecoration(label: Text("Email *")),
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
            controller: message,
            validator: validateName,
            decoration: const InputDecoration(labelText: "Message *"),
            maxLines: 3,
          ),
          const SizedBox(height: 40),
          AppElevatedButton(
            onPressed:submit,
            notifier: btnNotifier,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 0),
              padding: const EdgeInsets.all(20)
            ),
            child: const ArrowText(child: Text("SEND MESSAGE")),
          ),
        ],
      ),
    );
  }

  final btnNotifier = ValueNotifier(false);
  Future submit() async {
    try{
      if(!formKey.currentState!.validate()) return;
      btnNotifier.value = true;
      await Future.delayed(Duration(seconds: 3));
      context.showSuccessSnackBar("Message sent successfully");
    } catch(error) {
      context.showErrorSnackBar(error);
    } finally {
      btnNotifier.value = false;
    }
  }
}
