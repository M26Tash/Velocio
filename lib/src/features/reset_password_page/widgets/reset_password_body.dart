// ignore_for_file: lines_longer_than_80_chars, use_if_null_to_convert_nulls_to_bools

import 'package:flutter/material.dart';
import 'package:velocio/src/features/reset_password_page/cubit/reset_password_cubit.dart';
import 'package:velocio/src/features/reset_password_page/widgets/page_view_body/enter_email_body.dart';
import 'package:velocio/src/features/reset_password_page/widgets/page_view_body/enter_otp_body.dart';
import 'package:velocio/src/features/reset_password_page/widgets/page_view_body/enter_password_body.dart';

class ResetPasswordBody extends StatefulWidget {
  final ResetPasswordCubit cubit;
  final String email;
  const ResetPasswordBody({
    required this.cubit,
    required this.email,
    super.key,
  });

  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        EnterEmailBody(
          cubit: widget.cubit,
          controller: pageController,
        ),
        EnterOtpBody(
          cubit: widget.cubit,
          controller: pageController,
          email: widget.email,
        ),
        EnterPasswordBody(
          cubit: widget.cubit,
          controller: pageController,
        ),
      ],
    );
  }
}
