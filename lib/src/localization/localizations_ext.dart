import 'package:flutter/material.dart';
import 'package:velocio/src/localization/flutter_gen/velocio_localization.dart';

extension LocalizationsExt on BuildContext {
  VelocioLocalization get locale => VelocioLocalization.of(this);
}
