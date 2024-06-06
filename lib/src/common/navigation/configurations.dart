import 'package:velocio/src/common/navigation/entities/page_configuration.dart';
import 'package:velocio/src/common/navigation/routes.dart';

PageConfiguration authConfig() {
  return PageConfiguration(path: Routes.authPath.name);
}

PageConfiguration otpConfig() {
  return PageConfiguration(path: Routes.otpPath.name);
}

PageConfiguration resetPasswordConfig() {
  return PageConfiguration(path: Routes.resetPasswordPath.name);
}
