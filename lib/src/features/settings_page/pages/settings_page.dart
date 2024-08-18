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
import 'package:velocio/src/features/settings_page/cubit/settings_cubit.dart';
import 'package:velocio/src/features/settings_page/widgets/settings_body.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final cubit = i.get<SettingsCubit>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => cubit.getProfileModel(),
    );
  }

  void _listener(BuildContext context, SettingsState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(SettingsState prev, SettingsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<SettingsCubit>(
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<SettingsCubit>(context);

          if (state.profileModel == const ProfileModel().empty()) {
            return BasePage(
              body: Center(
                child: CircularProgressIndicator(
                  color: context.theme.mainColor,
                ),
              ),
            );
          }
          
          return BasePage(
            appBar: CustomAppBar(
              isLeading: true,
              icon: Icons.arrow_back_ios,
              onLeadingPressed: cubit.onBackTap,
              title: Text(
                context.locale.settings,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              centerTitle: true,
            ),
            body: SettingsBody(
              currentLocale: Locale(context.locale.localeName),
              currentThemeType: cubit.currentThemeType,
              cubit: cubit,
              profileModel: state.profileModel!,
            ),
          );
        },
      ),
    );
  }
}
