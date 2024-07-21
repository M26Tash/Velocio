import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/core/domain/interactors/auth_interactor.dart';
import 'package:velocio/src/core/domain/interactors/local_auth_interactor.dart';

part 'security_state.dart';

class SecurityCubit extends Cubit<SecurityState> {
  final AuthInteractor _authInteractor;
  final LocalAuthInteractor _localAuthInteractor;
  SecurityCubit(
    this._authInteractor,
    this._localAuthInteractor,
  ) : super(
          const SecurityState(
            route: CustomRoute(null, null),
            isLocalAuth: null,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<bool?>? _isLocalAuthSubscription;

  @override
  Future<void> close() {
    _isLocalAuthSubscription?.cancel();
    _isLocalAuthSubscription = null;

    return super.close();
  }

  void _subscribeAll() {
    _isLocalAuthSubscription?.cancel();
    _isLocalAuthSubscription = _localAuthInteractor.isLocalAuthStream.listen(
      _onNewIsLocalAuth,
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

  Future<void> authenticateWithBiometrics() async {
    return _localAuthInteractor.authenticateWithBiometrics(
      localizedReason: 'Please authenticate to continue',
    );
  }

  void _onNewIsLocalAuth(bool? isLocalAuth) {
    emit(
      state.copyWith(
        isLocalAuth: isLocalAuth,
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
