import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/navigation/entities/page_arguments.dart';
import 'package:velocio/src/common/navigation/entities/router_notifier.dart';
import 'package:velocio/src/common/navigation/entities/velocio_router_builder.dart';
import 'package:velocio/src/common/navigation/routes.dart';
import 'package:velocio/src/features/auth_page/pages/auth_page.dart';
import 'package:velocio/src/features/otp_page/pages/otp_page.dart';
import 'package:velocio/src/features/reset_password_page/pages/reset_password_page.dart';

abstract final class AppRouter {
  static final _initialRoute = Routes.authPath.route;

  static late GoRouter appRouter;

  // ignore: unused_field
  static final _initialExtra = UnimplementedError();
  static final _routerNotifier = RouterNotifier();
  static final _i = i;

  static final _appRoutes = <RouteBase>[
    VelocioRouteBuilder<AuthPage>(
      i: _i,
      routeConfig: Routes.authPath,
    ).buildTransparentRoute(),
    VelocioRouteBuilder<OtpPage>(
      i: _i,
      routeConfig: Routes.otpPath,
    ).buildTransparentRoute(),
    VelocioRouteBuilder<ResetPasswordPage>(
      i: _i,
      routeConfig: Routes.resetPasswordPath,
    ).buildTransparentRoute(),
  ];

  static GoRouter router({
    List<GoRoute>? routes,
    String? initialLocation,
    VoidCallback? onRouteErrorAction,
    PageArguments? initialExtra,
  }) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    final appRoutes = routes ?? _appRoutes;
    final router = GoRouter(
      routes: appRoutes,
      initialLocation: initialLocation ?? _initialRoute,
      initialExtra: initialExtra,
      debugLogDiagnostics: true,
      errorBuilder: (_, __) {
        return RedirectError(action: onRouteErrorAction);
      },
      refreshListenable: _routerNotifier,
    );
    appRouter = router;
    return router;
  }
}

@visibleForTesting
class RedirectError extends StatefulWidget {
  final VoidCallback? action;

  const RedirectError({this.action, super.key});

  @override
  State<RedirectError> createState() => _RedirectErrorState();
}

class _RedirectErrorState extends State<RedirectError> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(
      Duration.zero,
      widget.action ??
          () {
            context.push(AppRouter._initialRoute);
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}