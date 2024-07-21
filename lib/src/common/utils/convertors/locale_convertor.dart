import 'package:flutter/material.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

abstract final class LocaleConvertor {
  static Locale fromText(String text) {
    return switch (text) {
      'en' => const Locale('en'),
      'ru' => const Locale('ru'),
      'tr' => const Locale('tr'),
      'it' => const Locale('it'),
      _ => throw UnimplementedError()
    };
  }

  static String fromLocale(String locale, BuildContext context) {
    return switch (locale) {
      'en' => context.locale.contacts,
      'ru' => context.locale.contacts,
      'tr' => context.locale.contacts,
      _ => throw UnimplementedError(),
    };
  }
}
