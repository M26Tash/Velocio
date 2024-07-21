import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/navigation/entities/page_arguments.dart';
import 'package:velocio/src/common/navigation/entities/router_notifier.dart';
import 'package:velocio/src/common/navigation/entities/velocio_router_builder.dart';
import 'package:velocio/src/common/navigation/routes.dart';
import 'package:velocio/src/features/auth_page/pages/auth_page.dart';
import 'package:velocio/src/features/bio_page/pages/bio_page.dart';
import 'package:velocio/src/features/chat_page/pages/chat_page.dart';
import 'package:velocio/src/features/contact_page/page/contact_page.dart';
import 'package:velocio/src/features/device_management_page/pages/device_management_page.dart';
import 'package:velocio/src/features/main_page/pages/main_page.dart';
import 'package:velocio/src/features/my_account_page/pages/my_account_page.dart';
import 'package:velocio/src/features/otp_page/pages/otp_page.dart';
import 'package:velocio/src/features/privacy_page/pages/privacy_page.dart';
import 'package:velocio/src/features/reset_password_page/pages/reset_password_page.dart';
import 'package:velocio/src/features/security_page/pages/security_page.dart';
import 'package:velocio/src/features/settings_page/pages/settings_page.dart';

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
    VelocioRouteBuilder<MainPage>(
      i: _i,
      routeConfig: Routes.mainPath,
    ).buildTransparentRoute(),
    VelocioRouteBuilder<SettingsPage>(
      i: _i,
      routeConfig: Routes.settingsPath,
    ).buildTransparentRoute(),
    VelocioRouteBuilder<ContactPage>(
      i: _i,
      routeConfig: Routes.contactPath,
    ).buildTransparentRoute(),
    VelocioRouteBuilder<DeviceManagementPage>(
      i: _i,
      routeConfig: Routes.deviceManagementPath,
    ).buildTransparentRoute(),
    VelocioRouteWithParamBuilder<BioPage, BioArguments>(
      i: _i,
      routeConfig: Routes.bioPath,
      getFirstParams: (state) => state.extra! as BioArguments,
    ).buildTransparentRoute(),
    VelocioRouteBuilder<MyAccountPage>(
      i: _i,
      routeConfig: Routes.myAccountPath,
    ).buildTransparentRoute(),
    VelocioRouteBuilder<PrivacyPage>(
      i: _i,
      routeConfig: Routes.privacyPath,
    ).buildTransparentRoute(),
    VelocioRouteBuilder<SecurityPage>(
      i: _i,
      routeConfig: Routes.securityPath,
    ).buildTransparentRoute(),
    VelocioRouteBuilder<ChatPage>(
      i: _i,
      routeConfig: Routes.chatPath,
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
