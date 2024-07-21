import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/configurations.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/common/shared_cubits/app_locale_cubit/app_locale_cubit.dart';
import 'package:velocio/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:velocio/src/common/utils/enum/theme_type.dart';
import 'package:velocio/src/core/domain/interactors/auth_interactor.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final ThemeCubit _themeCubit;
  final AppLocaleCubit _appLocaleCubit;
  final AuthInteractor _authInteractor;
  final DataInteractor _dataInteractor;

  SettingsCubit(
    this._themeCubit,
    this._appLocaleCubit,
    this._authInteractor,
    this._dataInteractor,
  ) : super(
          SettingsState(
            route: const CustomRoute(null, null),
            avatarUrl: null,
            fullName: null,
            profileModel: const ProfileModel().empty(),
          ),
        ) {
    _subscribeAll();
  }

  ThemeType get currentThemeType => _themeCubit.themeType;

  StreamSubscription<String?>? _avatarUrlSubscription;
  StreamSubscription<String?>? _fullNameSubscription;
  StreamSubscription<ProfileModel?>? _profileModelSubscription;
  StreamSubscription<bool?>? _isLocalAuthSubscription;

  @override
  Future<void> close() {
    _avatarUrlSubscription?.cancel();
    _avatarUrlSubscription = null;

    _fullNameSubscription?.cancel();
    _fullNameSubscription = null;

    _profileModelSubscription?.cancel();
    _profileModelSubscription = null;

    _isLocalAuthSubscription?.cancel();
    _isLocalAuthSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _avatarUrlSubscription?.cancel();
    _avatarUrlSubscription = _dataInteractor.avatarUrlStream.listen(
      _onNewAvatarUrl,
    );

    _profileModelSubscription?.cancel();
    _profileModelSubscription = _dataInteractor.profileModelStream.listen(
      _onNewProfileModel,
    );

    // _isLocalAuthSubscription?.cancel();
    // _isLocalAuthSubscription = _localAuthInteractor.isLocalAuthStream.listen(
    //   _onNewIsLocalAuth,
    // );
  }

  // Future<void> authenticateWithBiometrics() async {
  //   return _localAuthInteractor.authenticateWithBiometrics(
  //     localizedReason: 'Please authenticate to continue',
  //   );
  // }

  Future<void> getAvatarUrl() async {
    return _dataInteractor.getAvatarUrl();
  }

  Future<void> getProfileModel() async {
    return _dataInteractor.getProfileModel();
  }

  Future<void> signOut({
    required Function(String) onError,
  }) async {
    return _authInteractor.signOut(
      onError: onError,
    );
  }

  Future<void> setTheme(ThemeType themeType) {
    return _themeCubit.setThemeType(
      themeType,
    );
  }

  Future<void> setLocale(Locale locale) {
    return _appLocaleCubit.setLocale(
      locale,
    );
  }

  void _onNewAvatarUrl(String? avatarUrl) {
    emit(
      state.copyWith(
        avatarUrl: avatarUrl,
      ),
    );
  }

  void _onNewProfileModel(ProfileModel? profileModel) {
    emit(
      state.copyWith(
        profileModel: profileModel,
      ),
    );
  }

  // void _onNewIsLocalAuth(bool? isLocalAuth) {
  //   emit(
  //     state.copyWith(
  //       profileModel: profileModel,
  //     ),
  //   );
  // }

  void navigateToMyAccountPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          myAccountConfig(),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToSecurityPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          securityConfig(),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToPrivacyPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          privacyConfig(),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToDeviceManagementPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          deviceManagementConfig(),
        ),
      ),
    );

    _resetRoute();
  }

  void onBackTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );

    _resetRoute();
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }
}
