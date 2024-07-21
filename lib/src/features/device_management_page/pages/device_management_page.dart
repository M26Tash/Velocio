import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:velocio/src/features/device_management_page/cubit/device_management_cubit.dart';
import 'package:velocio/src/features/device_management_page/widgets/device_management_body.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class DeviceManagementPage extends StatelessWidget {
  const DeviceManagementPage({super.key});

  void _listener(BuildContext context, DeviceManagementState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(DeviceManagementState prev, DeviceManagementState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<DeviceManagementCubit>(
      child: BlocConsumer<DeviceManagementCubit, DeviceManagementState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<DeviceManagementCubit>(context);
          return BasePage(
            appBar: CustomAppBar(
              isLeading: true,
              onLeadingPressed: cubit.onBackTap,
              title: Text(
                context.locale.devices,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              centerTitle: true,
            ),
            body: const DeviceManagementBody(),
          );
        },
      ),
    );
  }
}
