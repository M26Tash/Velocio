import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rxdart/subjects.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_local_auth_data_source.dart';
import 'package:velocio/src/core/domain/utils/custom_logger.dart';

class LocalAuthDataSource implements ILocalAuthDataSource {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  final BehaviorSubject<bool?> _isLocalAuthSubject = BehaviorSubject();

  @override
  Stream<bool?> get isLocalAuthStream => _isLocalAuthSubject;

  @override
  Future<void> authenticateWithBiometrics({
    required String localizedReason,
  }) async {
    try {
      final isLocalAuth = await _localAuthentication.authenticate(
        localizedReason: localizedReason,
      );

      _isLocalAuthSubject.add(isLocalAuth);
    } on PlatformException catch (e) {
      CustomLogger.errorLog(
        'authenticateWithBiometrics',
        params: {
          'Error authenticating with biometrics:': '$e',
        },
      );
    }
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      CustomLogger.errorLog(
        'getAvailableBiometrics',
        params: {
          'Error getting available biometrics:': '$e',
        },
      );
      return [];
    }
  }
}
