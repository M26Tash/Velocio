import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/features/app/pages/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseKey = dotenv.env['SUPABASE_KEY'];

  await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseKey!,
  );

  injectDependencies();

  runApp(const App());
}
