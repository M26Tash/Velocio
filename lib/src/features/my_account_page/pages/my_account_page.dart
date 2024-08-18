import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:velocio/src/core/domain/models/profile_model/profile_model.dart';
import 'package:velocio/src/features/my_account_page/cubit/my_account_cubit.dart';
import 'package:velocio/src/features/my_account_page/widgets/my_account_body.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final myAccountCubit = i.get<MyAccountCubit>();
  @override
  void initState() {
    super.initState();

    myAccountCubit.getProfileModel();
  }

  void _listener(BuildContext context, MyAccountState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(MyAccountState prev, MyAccountState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<MyAccountCubit>(
      child: BlocConsumer<MyAccountCubit, MyAccountState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<MyAccountCubit>(context);

          if (state.profileModel == const ProfileModel().empty()) {
            return const BasePage(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return BasePage(
            appBar: CustomAppBar(
              isLeading: true,
              onLeadingPressed: cubit.onBackTap,
              title: Text(
                context.locale.myAccount,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              centerTitle: true,
            ),
            body: MyAccountBody(
              // avatarUrl: state.avatarUrl,
              profileModel: state.profileModel,
              cubit: cubit,
            ),
          );
        },
      ),
    );
  }
}
