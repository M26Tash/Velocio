import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/core/data/data_source/auth_data_source.dart';
import 'package:velocio/src/core/data/data_source/data_source.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_data_source.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_local_auth_data_source.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_local_data_source.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_settings_data_source.dart';
import 'package:velocio/src/core/data/data_source/local_auth_data_source.dart';
import 'package:velocio/src/core/data/data_source/local_data_source.dart';
import 'package:velocio/src/core/data/data_source/settings_data_source.dart';

void initDataSource() {
  i
    ..registerSingleton<IAuthDataSource>(
      AuthDataSource(),
    )
    ..registerSingleton<ISettingsDataSource>(
      SettingsDataSource(),
    )
    ..registerSingleton<ILocalDataSource>(
      LocalDataSource(
        i.get(),
      ),
    )
    ..registerSingleton<IDataSource>(
      DataSource(
        i.get(),
      ),
    )
    ..registerSingleton<ILocalAuthDataSource>(
      LocalAuthDataSource(),
    );
}
