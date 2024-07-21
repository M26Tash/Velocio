// ignore_for_file: unused_element

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/core/domain/interactors/auth_interactor.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthInteractor _authInteractor;
  ResetPasswordCubit(this._authInteractor)
      : super(
          const ResetPasswordState(
            route: CustomRoute(null, null),
            email: '',
          ),
        );

  Future<void> signInWithOtp({
    required String email,
    required Function(String) onError,
    required Function() onSuccess,
  }) {
    _insertEmail(email);
    return _authInteractor.signInWithOtp(
      email: email,
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

  Future<void> updateNewPassword({
    required String password,
    required Function(String) onError,
    required Function() onSuccess,
  }) {
    return _authInteractor.updateNewPassword(
      password: password,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  void _insertEmail(String email) {
    emit(
      state.copyWith(
        email: email,
      ),
    );
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
