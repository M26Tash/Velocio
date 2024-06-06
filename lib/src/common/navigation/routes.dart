import 'package:velocio/src/common/navigation/entities/base_routes.dart';

enum Routes implements BaseRoutes {
  authPath('/auth-page'),
  otpPath('/otp-page'),
  resetPasswordPath('/reset-password-page');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
