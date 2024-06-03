import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/features/auth_page/pages/auth_page.dart';

void initPages() {
  i.registerFactory<AuthPage>(AuthPage.new);
}
