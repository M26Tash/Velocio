import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:velocio/src/core/domain/interfaces/i_auth_repository.dart';

final class AuthInteractor {
  final IAuthRepository _authRepository;

  AuthInteractor(this._authRepository);

  String? get userId => _authRepository.userId;

  bool get isAuth => _authRepository.session != null;

  User? get currentUser => _authRepository.currentUser;

  Future<void> loginWithPassword({
    required String email,
    required String password,
    required Function(String) onError,
    required VoidCallback onSuccess,
  }) async {
    return _authRepository.loginWithPassword(
      email: email,
      password: password,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> signInWithOtp({
    required String email,
    required Function(String) onError,
    required VoidCallback onSuccess,
  }) async {
    return _authRepository.signInWithOtp(
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
    required VoidCallback onSuccess,
  }) async {
    return _authRepository.signUpWithPassword(
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> signOut({
    required Function(String) onError,
  }) async {
    return _authRepository.signOut(
      onError: onError,
    );
  }

  Future<void> verifyOtp({
    required String email,
    required String token,
    required Function(String) onError,
    required VoidCallback onSuccess,
  }) async {
    return _authRepository.verifyOtp(
      email: email,
      token: token,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  Future<void> updateNewPassword({
    required String password,
    required Function(String) onError,
    required VoidCallback onSuccess,
  }) async {
    return _authRepository.updateNewPassword(
      password: password,
      onError: onError,
      onSuccess: onSuccess,
    );
  }
}
