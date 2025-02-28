part of '../theme.dart';

/// Style plan
/// display Medium & large is for big texts
/// displaySmall is for titles of normal text sections
/// bodyMedium is for normal text
class MobileTextStyles implements AppTextStyle{
  @override
  TextStyle displaySmall = const TextStyle(
    fontSize: 14,
    fontFamily: AppFont.cormorantInfant,
    color: AppColors.textColor,
  );

  @override
  TextStyle displayMedium = const TextStyle(
    fontSize: 34,
    fontFamily: AppFont.michroma,
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle displayLarge = const TextStyle(
    fontSize: 24,
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
    fontSize: 14,
    fontFamily: AppFont.cormorantInfant,
    color: AppColors.textColor,
  );
  @override
  TextStyle bodyLarge = const TextStyle(
    fontSize: 24,
    fontFamily: AppFont.cormorantInfant,
    color: AppColors.textColor,
  );
}
