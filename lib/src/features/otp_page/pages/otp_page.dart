import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/features/otp_page/cubit/otp_cubit.dart';
import 'package:velocio/src/features/otp_page/widgets/otp_body.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CubitScope<OtpCubit>(
      child: BlocBuilder<OtpCubit, OtpState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: const OtpBody(),
          );
        },
      ),
    );
  }
}
