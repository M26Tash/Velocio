import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class IAuthRepository {
  String? get userId;

  Session? get session;

  User? get currentUser;

  Future<void> signUpWithPassword({
    required String email,
    required String phoneNumber,
    required String password,
    required Function(String) onError,
    required VoidCallback onSuccess,
  });

  Future<void> loginWithPassword({
    required String email,
    required String password,
    required Function(String) onError,
    required VoidCallback onSuccess,
  });

  Future<void> signInWithOtp({
    required String email,
    required Function(String) onError,
    required VoidCallback onSuccess,
  });

  Future<void> signOut({
    required Function(String) onError,
  });

  Future<void> verifyOtp({
    required String email,
    required String token,
    required Function(String) onError,
    required VoidCallback onSuccess,
  });

  Future<void> updateNewPassword({
    required String password,
    required Function(String) onError,
    required VoidCallback onSuccess,
  });
}
