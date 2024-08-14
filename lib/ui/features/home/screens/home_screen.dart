import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onah_portfolio/core/constants/route_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(),
          const Text("Home - WIP"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => context.go(RouteNames.projects),
            child: const Text("Projects"),
          ),
        ],
      ),
    );
  }
}
