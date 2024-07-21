import 'package:local_auth/local_auth.dart';
import 'package:velocio/src/core/data/data_source/interfaces/i_local_auth_data_source.dart';
import 'package:velocio/src/core/domain/interfaces/i_local_auth_repository.dart';

final class LocalAuthRepository implements ILocalAuthRepository {
  final ILocalAuthDataSource _localAuthDataSource;

  LocalAuthRepository(this._localAuthDataSource);

  @override
  Stream<bool?> get isLocalAuthStream => _localAuthDataSource.isLocalAuthStream;

  @override
  Future<void> authenticateWithBiometrics({
    required String localizedReason,
    bool useErrorDialogs = true,
    bool stickyAuth = true,
  }) async {
    return _localAuthDataSource.authenticateWithBiometrics(
      localizedReason: localizedReason,
    );
  }

  @override
  Future<List<BiometricType>> getAvailableBiometrics() async {
    return _localAuthDataSource.getAvailableBiometrics();
  }
}
