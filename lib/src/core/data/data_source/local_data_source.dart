// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocio/src/common/utils/enum/theme_type.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_local_data_source.dart';
import 'package:velocio/src/core/domain/utils/custom_logger.dart';

class LocalDataSource implements ILocalDataSource {
  final IAuthDataSource _authDataSource;

  LocalDataSource(this._authDataSource);

  String get userId => _authDataSource.userId ?? '';

  @override
  Future<void> writeThemeType({required ThemeType themeType}) async {

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme_type', '$themeType');
      CustomLogger.infoLog('theme type successfully saved | $themeType');
    } catch (e) {
      CustomLogger.errorLog('Something went wrong {[writeThemeType]}');
    }
  }

  @override
  Future<String> readThemeType() async {

    try {
      final prefs = await SharedPreferences.getInstance();
      CustomLogger.infoLog('theme type successfully red | ${prefs.getString('theme_type')}');
      return prefs.getString('theme_type') ?? '${ThemeType.light}';
    } catch (e) {
      CustomLogger.errorLog('Something went wrong {[readThemeType]}');
    }
    return '';
  }

  @override
  Future<void> writeLocale({
    required Locale locale,
  }) async {

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('locale', '$locale');
      CustomLogger.infoLog('locale successfully saved | $locale');
    } catch (e) {
      CustomLogger.errorLog('Something went wrong {[writeLocale]}');
    }
  }

  @override
  Future<String> readLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      CustomLogger.infoLog('locale successfully red | ${prefs.getString('locale')}');
      return prefs.getString('locale') ?? '${const Locale('en')}';
    } catch (e) {
      CustomLogger.errorLog('Something went wrong {[readLocale]}');
    }

    return '';
  }
}
