import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:velocio/src/common/navigation/app_router.dart';
import 'package:velocio/src/common/navigation/configurations.dart';
import 'package:velocio/src/common/navigation/entities/custom_route.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          const AuthState(),
        );

  GoRouter get _router => AppRouter.appRouter;

  void navigateToOtpPage() {
    _router.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        otpConfig(),
      ),
    );
  }
}
