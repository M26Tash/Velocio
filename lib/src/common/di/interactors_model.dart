import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/core/domain/interactors/auth_interactor.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';
import 'package:velocio/src/core/domain/interactors/local_auth_interactor.dart';
import 'package:velocio/src/core/domain/interactors/local_data_interactor.dart';
import 'package:velocio/src/core/domain/interactors/settings_interactor.dart';

void initInteractors() {
  i
    ..registerSingleton<AuthInteractor>(
      AuthInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<SettingsInteractor>(
      SettingsInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<LocalDataInteractor>(
      LocalDataInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<DataInteractor>(
      DataInteractor(
        i.get(),
      ),
    )
    ..registerSingleton<LocalAuthInteractor>(
      LocalAuthInteractor(
        i.get(),
      ),
    );
}
