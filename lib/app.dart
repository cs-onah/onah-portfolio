import 'package:flutter/material.dart';
import 'package:onah_portfolio/core/config/route_config.dart';
import 'package:onah_portfolio/core/utils/context_extension.dart';
import 'package:onah_portfolio/ui/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Onah's Portfolio",
      routerConfig: appRouter,
      theme: buildDarkTheme(context.screenType),
      debugShowCheckedModeBanner: false,
    );
  }
}
