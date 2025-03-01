import 'package:flutter/material.dart';
import 'package:onah_portfolio/ui/shared/widgets/app_snackbar.dart';
import 'package:onah_portfolio/ui/themes/app_colors.dart';
import 'package:onah_portfolio/ui/themes/device_size_enum.dart';
import 'package:onah_portfolio/ui/themes/theme.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  Color get primaryColor => theme.primaryColor;
  Color get cardColor => theme.cardColor;
  Color get errorColor => theme.colorScheme.error;
  Color get secondaryColor => theme.colorScheme.secondary;
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;

  ScreenType get screenType => getScreenType(this);

  AppColorExtension get colors =>
      Theme.of(this).extension<AppColorExtension>()!;

  double get height => MediaQuery.of(this).size.height;

  EdgeInsets get screenPadding => MediaQuery.of(this).padding;

  double get width => MediaQuery.of(this).size.width;

  void showMessage(dynamic message, {Duration? duration}) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey[800],
          content: Row(
            children: [
              const Icon(Icons.info_outline, color: Colors.white),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  "$message",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: AppFont.aeonik,
                  ),
                ),
              ),
            ],
          ),
          duration: duration ?? const Duration(seconds: 5),
        ),
      );

  void showErrorSnackBar(dynamic error) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.cancel, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  error.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: AppFont.aeonik,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.red,
        ),
      );

  void showSuccessSnackBar(dynamic message) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "$message",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: AppFont.aeonik,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.green,
        ),
      );

  T customTheme<T>() => Theme.of(this).extension<T>()!;

  T arg<T>() => ModalRoute.of(this)!.settings.arguments as T;

  bool get canPop => Navigator.of(this).canPop();

  void popToFirstScreen() =>
      Navigator.of(this).popUntil((route) => route.isFirst);

  void pop<T>([T? result]) => Navigator.pop(this, result);

  void openDrawer() => Scaffold.of(this).openDrawer();

  void maybePop<T>([T? result]) => Navigator.maybePop(this, result);

  Future<T?> push<T>(Widget widget, {bool fullscreenDialog = false}) async =>
      await Navigator.push<T>(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
          fullscreenDialog: fullscreenDialog,
        ),
      );

  void pushReplacement(Widget widget) => Navigator.pushReplacement(
      this, MaterialPageRoute(builder: (context) => widget));

  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) async =>
      await Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(newRouteName, predicate,
          arguments: arguments);

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Widget widget,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => widget,
          settings: RouteSettings(arguments: arguments),
        ),
        predicate,
      );

  void closeDrawer() => Scaffold.of(this).closeDrawer();
}
