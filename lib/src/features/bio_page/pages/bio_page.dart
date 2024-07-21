import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/navigation/entities/page_arguments.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:velocio/src/features/bio_page/cubit/bio_cubit.dart';
import 'package:velocio/src/features/bio_page/widgets/bio_body.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class BioPage extends StatelessWidget {
  final String? email;
  final String? phoneNumber;
  const BioPage({
    required this.email,
    required this.phoneNumber,
    super.key,
  });

  void _listener(BuildContext context, BioState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(BioState prev, BioState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<BioCubit>(
      child: BlocConsumer<BioCubit, BioState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<BioCubit>(context);
          return BasePage(
            appBar: CustomAppBar(
              isLeading: true,
              icon: Icons.arrow_back_ios,
              onLeadingPressed: cubit.onBackTap,
              title: Text(
                context.locale.bio,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              centerTitle: true,
            ),
            body: BioBody(
              cubit: cubit,
              dateOfBirth: state.dateTime,
              imageFile: state.file,
              avatarUrl: state.avatarUrl,
              email: email,
              phoneNumber: phoneNumber,
            ),
          );
        },
      ),
    );
  }
}

final class BioArguments extends PageArguments {
  final String? email;
  final String? phoneNumber;

  @override
  List<Object?> get props => [
        email,
        phoneNumber,
      ];

  BioArguments({
    required this.email,
    required this.phoneNumber,
  });
}
