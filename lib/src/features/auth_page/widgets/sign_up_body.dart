// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:email_validator/email_validator.dart';
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

class SignUpBody extends StatefulWidget {
  final AuthCubit cubit;
  final VoidCallback showLogin;
  const SignUpBody({
    required this.cubit,
    required this.showLogin,
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final nameFormKey = GlobalKey<FormState>();
  final usernameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;

  late final RegExp nameRegExp;
  late final RegExp phoneRegExp;

  bool isObscured = false;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();

    nameRegExp = RegExp('[a-zA-Z]');
    phoneRegExp = RegExp('[0-9]');
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
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
        const SizedBox(height: AppDimensions.large),
        Image.asset(AppAssets.signUpIllustration),
        Text(
          context.locale.signUp,
          style: context.themeData.textTheme.displayLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightSemiBold,
          ),
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        InputField(
          formKey: emailFormKey,
          controller: emailController,
          hintText: context.locale.email,
          validator: (value) {
            if (value!.isEmpty) {
              return context.locale.pleaseEnterYourEmail;
            } else if (!EmailValidator.validate(value)) {
              return context.locale.pleaseEnterYourCorrectEmail;
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          controller: phoneNumberController,
          hintText: context.locale.phoneNumber,
        ),
        const SizedBox(height: AppDimensions.large),
        InputField(
          formKey: passwordFormKey,
          controller: passwordController,
          hintText: context.locale.password,
          obscureText: isObscured,
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
        const SizedBox(height: AppDimensions.superLarge),
        CustomButton(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: context.theme.mainColor,
            ),
          ],
          text: context.locale.createAccount,
          onTap: () {
            final validateEmail = emailFormKey.currentState?.validate();
            final validatePassword = passwordFormKey.currentState?.validate();
            
            if (validateEmail == true && validatePassword == true) {
              
              widget.cubit.signUpWithPassword(
                email: emailController.text.trim(),
                phoneNumber: phoneNumberController.text.trim(),
                password: passwordController.text.trim(),
                onError: (error) => context.showErrorSnackbar(error),
                onSuccess: () => widget.cubit.navigateToBioPage(
                  email: emailController.text.trim(),
                  phoneNumber: phoneNumberController.text.trim(),
                ),
              );
            }
          },
        ),
        const SizedBox(height: AppDimensions.large),
        Row(
          children: [
            Text(
              context.locale.doYouHaveAccount,
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                fontWeight: AppFonts.weightRegular,
                color: context.theme.secondaryTextColor,
              ),
            ),
            const SizedBox(width: AppDimensions.small),
            InkWell(
              onTap: widget.showLogin,
              child: Text(
                context.locale.login,
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
