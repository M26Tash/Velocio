import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/core/data/repositories/auth_repository.dart';
import 'package:velocio/src/core/data/repositories/data_repository.dart';
import 'package:velocio/src/core/data/repositories/local_auth_repository.dart';
import 'package:velocio/src/core/data/repositories/local_data_repository.dart';
import 'package:velocio/src/core/data/repositories/settings_repository.dart';
import 'package:velocio/src/core/domain/interfaces/i_auth_repository.dart';
import 'package:velocio/src/core/domain/interfaces/i_data_repository.dart';
import 'package:velocio/src/core/domain/interfaces/i_local_auth_repository.dart';
import 'package:velocio/src/core/domain/interfaces/i_local_data_repository.dart';
import 'package:velocio/src/core/domain/interfaces/i_settings_repository.dart';

void initRepositories() {
  i
    ..registerSingleton<IAuthRepository>(
      AuthRepository(
        i.get(),
      ),
    )
    ..registerSingleton<ISettingsRepository>(
      SettingsRepository(
        i.get(),
      ),
    )
    ..registerSingleton<ILocalDataRepository>(
      LocalDataRepository(
        i.get(),
      ),
    )
    ..registerSingleton<IDataRepository>(
      DataRepository(
        i.get(),
      ),
    )
    ..registerSingleton<ILocalAuthRepository>(
      LocalAuthRepository(
        i.get(),
      ),
    );
}
