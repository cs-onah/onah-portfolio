import 'package:flutter/material.dart';

/// Style plan
/// display Medium & large is for big texts
/// displaySmall is for titles of normal text sections
/// bodyMedium is for normal text
abstract class AppTextStyle {
  late TextStyle displaySmall;

  late TextStyle displayMedium;

  late TextStyle displayLarge;

  late TextStyle bodySmall;
  late TextStyle bodyMedium;
  late TextStyle bodyLarge;
}
