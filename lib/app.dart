import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/config/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Onah's Portfolio",
      routerConfig: appRouter,

    );
  }
}
