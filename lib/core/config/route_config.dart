import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onah_portfolio/core/constants/route_names.dart';
import 'package:onah_portfolio/ui/features/home/screens/root_screen.dart';
import 'package:onah_portfolio/ui/features/projects/screens/project_screen.dart';

final appRouter = GoRouter(
  initialLocation: RouteNames.home,
  errorBuilder: (_, __)=> const Scaffold(body: Text("404")),
  routes: [
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const RootScreen(),
    ),
    GoRoute(
      path: RouteNames.projects,
      builder: (context, state) => const ProjectScreen(),
    ),
  ],
);
