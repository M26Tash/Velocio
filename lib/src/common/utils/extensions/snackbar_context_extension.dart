import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

extension SnackbarContextExtension on BuildContext {
  Future<void> showErrorSnackbar(String messageText) async {
    AnimatedSnackBar.material(
      messageText,
      type: AnimatedSnackBarType.error,
    ).show(this);
  }

  Future<void> showInfoSnackbar(String messageText) async {
    AnimatedSnackBar.material(
      messageText,
      type: AnimatedSnackBarType.info,
    ).show(this);
  }

  Future<void> showSuccessSnackbar(String messageText) async {
    AnimatedSnackBar.material(
      messageText,
      type: AnimatedSnackBarType.success,
    ).show(this);
  }

  Future<void> showWarningSnackbar(String messageText) async {
    AnimatedSnackBar.material(
      messageText,
      type: AnimatedSnackBarType.warning,
    ).show(this);
  }
}
