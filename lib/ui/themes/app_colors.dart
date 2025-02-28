import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color red;
  final Color green;
  final Color white;
  final Color captionGrey;
  final Color black;
  final Color greyLight;
  final Color outlineColor;

  AppColorExtension(  {
    required this.green,
    required this.white,
    required this.red,
    required this.captionGrey,
    required this.black,
    required this.greyLight,
   required this.outlineColor,
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? green,
    Color? red,
    Color? white,
    Color? captionGrey,
    Color? black,
    Color? greyLight,
    Color? outlineColor,
  }) {
    return AppColorExtension(
      green: green ?? this.green,
      white: white ?? this.white,
      red: red ?? this.red,
      captionGrey: captionGrey ?? this.captionGrey,
      black: black ?? this.black,
      greyLight: greyLight ?? this.greyLight,
      outlineColor: outlineColor ?? this.outlineColor,
    );
  }

  @override
  ThemeExtension<AppColorExtension> lerp(
      covariant ThemeExtension<AppColorExtension>? other,
      double t
      ) =>
      this;
}
