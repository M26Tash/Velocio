import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:velocio/src/common/navigation/configurations.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/core/domain/interactors/auth_interactor.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthInteractor _authInteractor;
  final DataInteractor _dataInteractor;

  AuthCubit(
    this._authInteractor,
    this._dataInteractor,
  ) : super(
          const AuthState(
            route: CustomRoute(
              null,
              null,
            ),
            profileModel: null,
          ),
        ) {
    _subscribeAll();
  }

  bool get isAuth => _authInteractor.isAuth;

  User? get currentUser => _authInteractor.currentUser;

  StreamSubscription<ProfileModel?>? _profileSubscription;

  @override
  Future<void> close() {
    _profileSubscription?.cancel();
    _profileSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _profileSubscription?.cancel();
    _profileSubscription = _dataInteractor.profileModelStream.listen(
      _onNewProfileModel,
    );
  }

  Future<void> getProfileModel() async {
    return _dataInteractor.getProfileModel();
  }

  Future<void> loginWithPassword({
    required String email,
    required String password,
    required Function(String) onError,
    required Function() onSuccess,
  }) {
    return _authInteractor.loginWithPassword(
      email: email,
      password: password,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> signInWithOtp({
    required String email,
    required Function(String) onError,
    required Function() onSuccess,
  }) {
    return _authInteractor.signInWithOtp(
      email: email,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> signUpWithPassword({
    required String email,
    required String phoneNumber,
    required String password,
    required Function(String) onError,
    required Function() onSuccess,
  }) {
    return _authInteractor.signUpWithPassword(
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> verifyOtp({
    required String email,
    required String token,
    required Function(String) onError,
    required Function() onSuccess,
  }) {
    return _authInteractor.verifyOtp(
      email: email,
      token: token,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> signOut() {
    return _authInteractor.signOut(
      onError: (p0) {},
    );
  }

  void _onNewProfileModel(ProfileModel? profile) {
    emit(
      state.copyWith(
        profileModel: profile,
      ),
    );
  }

  void navigateToBioPage({
    required String? email,
    required String? phoneNumber,
  }) {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          bioConfig(
            email: email,
            phoneNumber: phoneNumber,
          ),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToResetPasswordPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          resetPasswordConfig(),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToOtpPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          otpConfig(),
        ),
      ),
    );

    _resetRoute();
  }

  void navigateToMainPage() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          mainConfig(),
        ),
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
