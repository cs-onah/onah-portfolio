import 'package:flutter/material.dart';
import 'package:onah_portfolio/ui/features/home/screens/form_page.dart';
import 'package:onah_portfolio/ui/features/home/screens/front_page.dart';
import 'package:onah_portfolio/ui/features/home/screens/project_page.dart';
import 'package:onah_portfolio/ui/features/home/screens/tools_page.dart';
import 'package:onah_portfolio/ui/features/home/widgets/footer.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      /// Prefer [SingleChildScrollView] to [ListView] so that all widgets are
      /// loaded, and user can navigate to headers using [Scrollable.ensureVisible]
      body: SingleChildScrollView(
        child: Column(
          children: [
            FrontPage(),
            ProjectPage(),
            ToolsPage(),
            FormPage(),
            SizedBox(height: 100),
            Footer(),
          ],
        ),
      ),
    );
  }
}
