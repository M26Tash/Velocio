import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/core/domain/interactors/data_interactor.dart';
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

  final dataInteractor = i.get<DataInteractor>();

  await dataInteractor.getUserStatus(isActive: true);

  timeago.setLocaleMessages('ru', timeago.RuMessages());
  timeago.setLocaleMessages('tr', timeago.TrMessages());
  timeago.setLocaleMessages('it', timeago.ItMessages());

  runApp(const App());
}
