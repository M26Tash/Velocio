import 'package:local_auth/local_auth.dart';

abstract interface class ILocalAuthDataSource {
  Stream<bool?> get isLocalAuthStream;

  Future<void> authenticateWithBiometrics({
    required String localizedReason,
  });

  Future<List<BiometricType>> getAvailableBiometrics();
}
