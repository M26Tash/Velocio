import 'package:flutter/material.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/features/app/pages/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  injectDependencies();

  runApp(const App());
}
