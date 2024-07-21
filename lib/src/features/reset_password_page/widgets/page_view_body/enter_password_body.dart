// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/extensions/snackbar_context_extension.dart';
import 'package:velocio/src/common/widgets/custom_button/custom_button.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/features/reset_password_page/cubit/reset_password_cubit.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class EnterPasswordBody extends StatefulWidget {
  final ResetPasswordCubit cubit;
  final PageController controller;
  const EnterPasswordBody({
    required this.cubit,
    required this.controller,
    super.key,
  });

  @override
  State<EnterPasswordBody> createState() => _EnterPasswordBodyState();
}

class _EnterPasswordBodyState extends State<EnterPasswordBody> {
  final passwordFormKey = GlobalKey<FormState>();
  final confirmPasswordFormKey = GlobalKey<FormState>();

  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();

    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        Image.asset(AppAssets.passwordIllustration),
        Text(
          context.locale.resetPassword,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        const SizedBox(height: AppDimensions.small),
        Text(
          context.locale.resetPasswordDescription,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            color: context.theme.secondaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: passwordFormKey,
          controller: _passwordController,
          hintText: context.locale.newPassword,
          validator: (value) {
            if (value!.isEmpty) {
              return context.locale.pleaseReEnterPassword;
            } else if (value.length < 8) {
              return context.locale.minimumEightCharacter;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: confirmPasswordFormKey,
          controller: _confirmPasswordController,
          hintText: context.locale.reEnterNewPassword,
          validator: (value) {
            if (value!.isEmpty) {
              return context.locale.pleaseReEnterPassword;
            } else if (value.length < 8) {
              return context.locale.minimumEightCharacter;
            } else if (value != _passwordController.text.trim()) {
              return context.locale.passwordDoesNotMatch;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: AppDimensions.superLarge),
        CustomButton(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: context.theme.mainColor,
            ),
          ],
          text: context.locale.submit,
          onTap: () {
            final validatePassword = passwordFormKey.currentState?.validate();
            final validateConfirmPassword =
                confirmPasswordFormKey.currentState?.validate();

            if (validatePassword == true && validateConfirmPassword == true) {
              widget.cubit.updateNewPassword(
                password: _passwordController.text.trim(),
                onError: (error) => context.showErrorSnackbar(error),
                onSuccess: () {},
              );
            }
          },
        ),
      ],
    );
  }
}
