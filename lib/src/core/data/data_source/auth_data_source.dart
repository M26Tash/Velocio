// ignore_for_file: avoid_dynamic_calls

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_auth_data_source.dart';
import 'package:velocio/src/core/domain/utils/custom_logger.dart';

class AuthDataSource implements IAuthDataSource {
  final supabase = Supabase.instance.client;

  @override
  String? get userId => supabase.auth.currentUser?.id ?? '';

  @override
  Session? get session => supabase.auth.currentSession;

  @override
  Future<void> loginWithPassword({
    required String email,
    required String password,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      onSuccess();
    } on AuthException catch (e) {
      CustomLogger.errorLog(
        'signInWithPassword',
        params: {'Caught error': e},
      );

      onError(e.message);
    }
  }

  @override
  Future<void> signInWithOtp({
    required String email,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    try {
      await supabase.auth.signInWithOtp(
        email: email,
        shouldCreateUser: false,
      );

      onSuccess();
    } on AuthException catch (e) {
      CustomLogger.errorLog(
        'signInWithOtp',
        params: {'Caught error': e},
      );
      onError(e.message);
    }
  }

  @override
  Future<void> signUpWithPassword({
    required String email,
    required String password,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
      );
      onSuccess();
    } on AuthException catch (e) {
      CustomLogger.errorLog(
        'signUpWithPassword',
        params: {'Caught error': e},
      );

      onError(e.message);
    }
  }

  @override
  Future<void> signOut({
    required Function(String) onError,
  }) async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (e) {
      CustomLogger.errorLog(
        'signOut',
        params: {'Caught error': e},
      );
    }
  }

  @override
  Future<void> verifyOtp({
    required String email,
    required String token,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    try {
      await supabase.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.email,
      );

      onSuccess();
    } on AuthException catch (e) {
      CustomLogger.errorLog(
        'verifyOtp',
        params: {'Caught error': e},
      );
      onError(e.message);
    }
  }

  @override
  Future<void> updateNewPassword({
    required String password,
    required Function(String) onError,
    required Function onSuccess,
  }) async {
    try {
      await supabase.auth.updateUser(
        UserAttributes(
          password: password,
        ),
      );

      onSuccess();
    } on AuthException catch (e) {
      CustomLogger.errorLog(
        'updateNewPassword',
        params: {'Caught error': e},
      );
      onError(e.message);
    }
  }
}
