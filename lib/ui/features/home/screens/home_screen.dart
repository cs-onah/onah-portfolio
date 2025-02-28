import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onah_portfolio/core/constants/route_names.dart';
import 'package:onah_portfolio/ui/features/home/screens/front_page.dart';
import 'package:onah_portfolio/ui/features/home/screens/project_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const FrontPage(),
          const ProjectPage(),
          const SizedBox(height: 10),
          // ElevatedButton(
          //   onPressed: () => context.go(RouteNames.projects),
          //   child: const Text("Projects"),
          // ),
        ],
      ),
    );
  }
}

