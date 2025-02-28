import 'package:flutter/material.dart';

enum ScreenType {
  mobile,
  tablet,
  desktop;

  bool get isMobile => this == ScreenType.mobile;
}

ScreenType getScreenType(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width >= 1024) {
    return ScreenType.desktop;
  } else if (width >= 600) {
    return ScreenType.tablet;
  } else {
    return ScreenType.mobile;
  }
}