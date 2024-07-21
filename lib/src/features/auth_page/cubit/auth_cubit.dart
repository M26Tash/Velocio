import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:velocio/src/common/navigation/configurations.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/core/domain/interactors/auth_interactor.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthInteractor _authInteractor;

  AuthCubit(
    this._authInteractor,
  ) : super(
          const AuthState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );

  bool get isAuth => _authInteractor.isAuth;

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
    required String password,
    required Function(String) onError,
    required Function() onSuccess,
  }) {
    return _authInteractor.signUpWithPassword(
      email: email,
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
