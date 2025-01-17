// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/utils/extensions/snackbar_context_extension.dart';
import 'package:velocio/src/common/widgets/custom_button/custom_button.dart';
import 'package:velocio/src/common/widgets/input_field/input_field.dart';
import 'package:velocio/src/features/auth_page/cubit/auth_cubit.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class LoginBody extends StatefulWidget {
  final AuthCubit cubit;
  final VoidCallback showSignUp;
  const LoginBody({
    required this.cubit,
    required this.showSignUp,
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _passwordFormKey = GlobalKey<FormState>();

  late final TextEditingController emailOrPhoneNumberController;
  late final TextEditingController passwordController;

  bool isObscured = false;

  @override
  void initState() {
    super.initState();

    emailOrPhoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    emailOrPhoneNumberController.dispose();
    passwordController.dispose();
  }

  void toggleObscure() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        const SizedBox(height: AppDimensions.extraLarge),
        Image.asset(AppAssets.signInIllustration),
        Text(
          context.locale.loginYourAccount,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          controller: emailOrPhoneNumberController,
          hintText: context.locale.email,
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: _passwordFormKey,
          controller: passwordController,
          hintText: context.locale.password,
          suffixIcon: IconButton(
            icon: Icon(
              isObscured ? Icons.visibility_off : Icons.visibility,
              color: context.theme.secondaryIconColor,
            ),
            onPressed: toggleObscure,
          ),
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
        const SizedBox(height: AppDimensions.medium),
        InkWell(
          onTap: widget.cubit.navigateToResetPasswordPage,
          child: Text(
            context.locale.forgotPassword,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              color: context.theme.secondaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
            textAlign: TextAlign.right,
          ),
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
          text: context.locale.login,
          onTap: () {
            final passwordState = _passwordFormKey.currentState?.validate();

            if (passwordState == true) {
              widget.cubit.loginWithPassword(
                email: emailOrPhoneNumberController.text.trim(),
                password: passwordController.text.trim(),
                onError: (error) => context.showErrorSnackbar(error),
                onSuccess: widget.cubit.navigateToMainPage,
              );
            }
          },
        ),
        const SizedBox(height: AppDimensions.large),
        Row(
          children: [
            Text(
              context.locale.dontHaveAccount,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: AppFonts.weightRegular,
                color: context.theme.secondaryTextColor,
              ),
            ),
            const SizedBox(width: AppDimensions.small),
            InkWell(
              onTap: widget.showSignUp,
              child: Text(
                context.locale.signUp,
                style: context.themeData.textTheme.headlineSmall?.copyWith(
                  fontWeight: AppFonts.weightRegular,
                  color: context.theme.quaternaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
