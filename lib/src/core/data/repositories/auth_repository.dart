import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:velocio/src/core/domain/interfaces/i_auth_repository.dart';

final class AuthRepository implements IAuthRepository {
  final IAuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  @override
  String? get userId => _authDataSource.userId;

  @override
  Session? get session => _authDataSource.session;

  @override
  User? get currentUser => _authDataSource.currentUser;

  @override
  Future<void> loginWithPassword({
    required String email,
    required String password,
    required Function(String) onError,
    required VoidCallback onSuccess,
  }) async {
    return _authDataSource.loginWithPassword(
      email: email,
      password: password,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  @override
  Future<void> signInWithOtp({
    required String email,
    required Function(String) onError,
    required VoidCallback onSuccess,
  }) async {
    return _authDataSource.signInWithOtp(
      email: email,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  @override
  Future<void> signUpWithPassword({
    required String email,
    required String phoneNumber,
    required String password,
    required Function(String) onError,
    required VoidCallback onSuccess,
  }) async {
    return _authDataSource.signUpWithPassword(
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  @override
  Future<void> signOut({
    required Function(String) onError,
  }) async {
    return _authDataSource.signOut(
      onError: onError,
    );
  }

  @override
  Future<void> verifyOtp({
    required String email,
    required String token,
    required Function(String) onError,
    required VoidCallback onSuccess,
  }) {
    return _authDataSource.verifyOtp(
      email: email,
      token: token,
      onError: onError,
      onSuccess: onSuccess,
    );
  }

  @override
  Future<void> updateNewPassword({
    required String password,
    required Function(String) onError,
    required VoidCallback onSuccess,
  }) async {
    return _authDataSource.updateNewPassword(
      password: password,
      onError: onError,
      onSuccess: onSuccess,
    );
  }
}
