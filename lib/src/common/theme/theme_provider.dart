// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/velocio_theme.dart';

final class ThemeProvider extends InheritedWidget {
  static ThemeProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  final VelocioTheme theme;
  final ThemeData themeData;

  const ThemeProvider({
    required this.theme,
    required this.themeData,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(ThemeProvider oldWidget){
    if (oldWidget is ThemeProvider) {
      return theme != oldWidget.theme || themeData != oldWidget.themeData;
    }
    return true;
  }
}
