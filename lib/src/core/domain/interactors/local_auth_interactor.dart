import 'package:velocio/src/core/domain/interfaces/i_local_auth_repository.dart';

final class LocalAuthInteractor {
  final ILocalAuthRepository _localAuthRepository;

  LocalAuthInteractor(this._localAuthRepository);

  Stream<bool?> get isLocalAuthStream => _localAuthRepository.isLocalAuthStream;

  Future<void> authenticateWithBiometrics({
    required String localizedReason,
    bool useErrorDialogs = true,
    bool stickyAuth = true,
  }) async {
    return _localAuthRepository.authenticateWithBiometrics(
      localizedReason: localizedReason,
      useErrorDialogs: useErrorDialogs,
      stickyAuth: stickyAuth,
    );
  }
}
