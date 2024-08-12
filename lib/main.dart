import 'package:flutter/material.dart';
import 'package:onah_portfolio/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}