library theme;

import 'package:flutter/material.dart';
import 'package:onah_portfolio/ui/themes/app_colors.dart';
import 'package:onah_portfolio/ui/themes/device_size_enum.dart';
import 'package:onah_portfolio/ui/themes/text_styles/app_text_style.dart';

part 'colors.dart';
part 'fonts.dart';
part 'text_styles/desktop_text_styles.dart';
part 'text_styles/mobile_text_styles.dart';

ThemeData buildDarkTheme(ScreenType type) {
  const Color primaryColor = AppColors.primaryColor;
  const Color secondaryColor = AppColors.white;

  AppTextStyle textStyle =
      type.isMobile ? MobileTextStyles() : DesktopTextStyles();

  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: AppColors.red,
  );

  final themeData = ThemeData(
    useMaterial3: false,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    cardColor: AppColors.white,
    colorScheme: colorScheme,
    dividerColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      elevation: 0,
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
      contentTextStyle: textStyle.bodyMedium,
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 0,
        minimumSize: const Size(0, 56),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.black,
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: AppFont.cormorantInfant,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        textStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontFamily: AppFont.cormorantInfant,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primaryColor,
        side: BorderSide.none,
        textStyle: textStyle.bodyMedium.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white),
      ),
      labelStyle: textStyle.textFieldStyle,
      floatingLabelStyle: textStyle.textFieldStyle,
      isDense: false,
      filled: false,
    ),
    fontFamily: AppFont.cormorantInfant,
    textTheme: TextTheme(
      bodyLarge: textStyle.bodyLarge,
      bodyMedium: textStyle.bodyMedium, // default text styling
      bodySmall: textStyle.bodySmall,
      displayLarge: textStyle.displayLarge,
      displayMedium: textStyle.displayMedium,
      displaySmall: textStyle.displaySmall,
      titleMedium: textStyle.textFieldStyle,
    ),
    extensions: [
      AppColorExtension(
        green: AppColors.green,
        white: AppColors.white,
        red: AppColors.red,
        captionGrey: AppColors.captionColor,
        black: AppColors.black,
        greyLight: AppColors.greyLight,
        outlineColor: AppColors.outlineColor,
      ),
    ],
  );
  return themeData;
}
