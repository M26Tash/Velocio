import 'package:local_auth/local_auth.dart';

abstract interface class ILocalAuthRepository {
  Stream<bool?> get isLocalAuthStream;

  Future<void> authenticateWithBiometrics({
    required String localizedReason,
    bool useErrorDialogs,
    bool stickyAuth,
  });

  Future<List<BiometricType>> getAvailableBiometrics();
}
