import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/shared_cubits/app_locale_cubit/app_locale_cubit.dart';
import 'package:velocio/src/common/shared_cubits/theme_cubit/theme_shared_cubit.dart';
import 'package:velocio/src/common/utils/enum/theme_type.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';

part 'app_state.dart';

const _defaultLocale = Locale('en');

class AppCubit extends Cubit<AppState> {
  final ThemeCubit _themeCubit;
  final AppLocaleCubit _appLocaleCubit;
  final DataInteractor _dataInteractor;
  AppCubit(
    this._themeCubit,
    this._appLocaleCubit,
    this._dataInteractor,
  ) : super(
          AppState(
            themeType: _themeCubit.state.themeType,
            locale: _defaultLocale,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<ThemeState>? _themeCubitSubscription;
  StreamSubscription<AppLocaleState>? _appLocaleCubitSubscription;

  @override
  Future<void> close() {
    _themeCubitSubscription?.cancel();
    _themeCubitSubscription = null;

    _appLocaleCubitSubscription?.cancel();
    _appLocaleCubitSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _themeCubitSubscription?.cancel();
    _themeCubitSubscription = _themeCubit.stream.listen((event) {
      emit(
        state.copyWith(
          themeType: event.themeType,
        ),
      );
    });

    _appLocaleCubitSubscription?.cancel();
    _appLocaleCubitSubscription = _appLocaleCubit.stream.listen(
      (event) {
        emit(
          state.copyWith(
            locale: event.locale,
          ),
        );
      },
    );
  }

  Future<void> getUserStatus({required bool isActive}) async {
    return _dataInteractor.getUserStatus(
      isActive: isActive,
    );
  }
}
