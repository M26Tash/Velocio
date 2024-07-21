import 'package:flutter/material.dart';
import 'package:velocio/src/common/utils/enum/theme_type.dart';

abstract interface class ILocalDataRepository {
  Future<void> writeThemeType({required ThemeType themeType});

  Future<String> readThemeType();

  Future<void> writeLocale({required Locale locale});

  Future<String> readLocale();
}
