import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_provider.dart';
import 'package:velocio/src/common/theme/velocio_theme.dart';

extension ThemeExtension on BuildContext {
  VelocioTheme get theme => ThemeProvider.of(this).theme;

  ThemeData get themeData => ThemeProvider.of(this).themeData;
}
