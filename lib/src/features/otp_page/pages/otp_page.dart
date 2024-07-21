import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/features/otp_page/cubit/otp_cubit.dart';
import 'package:velocio/src/features/otp_page/widgets/otp_body.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  void _listener(BuildContext context, OtpState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(OtpState prev, OtpState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<OtpCubit>(
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          return const BasePage(
            body: OtpBody(),
          );
        },
      ),
    );
  }
}
