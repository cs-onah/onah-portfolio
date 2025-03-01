part of '../theme.dart';

/// Style plan
/// display Medium & large is for big texts
/// displaySmall is for titles of normal text sections
/// bodyMedium is for normal text
class DesktopTextStyles implements AppTextStyle {
  @override
  TextStyle displaySmall = const TextStyle(
    fontSize: 32,
    fontFamily: AppFont.cormorantInfant,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle displayMedium = const TextStyle(
    fontSize: 54,
    fontFamily: AppFont.michroma,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle displayLarge = const TextStyle(
    fontSize: 64,
    fontFamily: AppFont.michroma,
    color: AppColors.textColor,
    fontWeight: FontWeight.w700,
  );

  @override
  TextStyle bodySmall = const TextStyle(
    fontSize: 14,
    fontFamily: AppFont.cormorantInfant,
    color: AppColors.textColor,
  );
  @override
  TextStyle bodyMedium = const TextStyle(
    fontSize: 16,
    fontFamily: AppFont.cormorantInfant,
    color: AppColors.textColor,
  );
  @override
  TextStyle bodyLarge = const TextStyle(
    fontSize: 28,
    fontFamily: AppFont.cormorantInfant,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle textFieldStyle = const TextStyle(
    fontSize: 24,
    fontFamily: AppFont.cormorantInfant,
    color: AppColors.textColor,
  );
}
