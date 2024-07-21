import 'package:flutter/material.dart';
import 'package:velocio/src/common/utils/enum/theme_type.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_local_data_source.dart';
import 'package:velocio/src/core/domain/interfaces/i_local_data_repository.dart';

final class LocalDataRepository implements ILocalDataRepository {
  final ILocalDataSource _localDataSource;

  LocalDataRepository(this._localDataSource);

  @override
  Future<void> writeThemeType({required ThemeType themeType}) async {
    return _localDataSource.writeThemeType(themeType: themeType);
  }

  @override
  Future<String> readThemeType() async {
    return _localDataSource.readThemeType();
  }

  @override
  Future<void> writeLocale({
    required Locale locale,
  }) async {
    return _localDataSource.writeLocale(locale: locale);
  }

  @override
  Future<String> readLocale() async {
    return _localDataSource.readLocale();
  }
}
