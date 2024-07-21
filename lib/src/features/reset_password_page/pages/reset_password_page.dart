import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:velocio/src/features/reset_password_page/cubit/reset_password_cubit.dart';
import 'package:velocio/src/features/reset_password_page/widgets/reset_password_body.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  void _listener(BuildContext context, ResetPasswordState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(ResetPasswordState prev, ResetPasswordState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ResetPasswordCubit>(
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<ResetPasswordCubit>(context);

          return BasePage(
            appBar: CustomAppBar(
              isLeading: true,
              onLeadingPressed: cubit.onBackTap,
            ),
            body: ResetPasswordBody(
              cubit: cubit,
              email: state.email,
            ),
          );
        },
      ),
    );
  }
}
