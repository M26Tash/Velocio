// ignore_for_file: avoid_positional_boolean_parameters

import 'package:velocio/src/common/utils/enum/theme_type.dart';

abstract final class ThemeTypeConvertor {
  static ThemeType fromText(String themeType) {
    return switch (themeType) {
      'ThemeType.light' => ThemeType.light,
      'ThemeType.dark' => ThemeType.dark,
      'ThemeType.system' => ThemeType.system,
      _ => throw UnimplementedError('Undefined theme type')
    };
  }

  // static ThemeType isNight(bool isNightMode) {
  //   return switch (isNightMode) {
  //     true => ThemeType.dark,
  //     false => ThemeType.light,
  //   };
  // }

  // static bool toBool(ThemeType themeType) {
  //   return switch (themeType) {
  //     ThemeType.dark => true,
  //     ThemeType.light => false,
  //   };
  // }
}
