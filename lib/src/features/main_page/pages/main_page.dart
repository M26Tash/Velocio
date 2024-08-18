import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/utils/constants/app_assets.dart';
import 'package:velocio/src/common/utils/constants/app_dimensions.dart';
import 'package:velocio/src/common/utils/constants/app_fonts.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:velocio/src/common/widgets/custom_drawer/custom_drawer.dart';
import 'package:velocio/src/common/widgets/custom_vector_button/custom_vector_button.dart';
import 'package:velocio/src/features/main_page/cubit/main_cubit.dart';
import 'package:velocio/src/features/main_page/widgets/main_body.dart';
import 'package:velocio/src/localization/localizations_ext.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainCubit = i.get<MainCubit>();

  late final AdvancedDrawerController _advancedDrawerController;

  @override
  void initState() {
    super.initState();

    _advancedDrawerController = AdvancedDrawerController();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => mainCubit
        ..getChats()
        ..getProfileModel(),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _advancedDrawerController.dispose();
  }

  void _listener(BuildContext context, MainState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(MainState prev, MainState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<MainCubit>(
      child: BlocConsumer<MainCubit, MainState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<MainCubit>(context);

          if (state.profile == null || state.chats == null) {
            return BasePage(
              body: Center(
                child: CircularProgressIndicator(
                  color: context.theme.mainColor,
                ),
              ),
            );
          }

          return AdvancedDrawer(
            backdropColor: context.theme.tertiaryColor,
            controller: _advancedDrawerController,
            childDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppDimensions.large,
                ),
              ),
            ),
            drawer: CustomDrawer(
              profileModel: state.profile!,
              onContactPageTap: cubit.navigateToContactPage,
              onSettingsPageTap: cubit.navigateToSettingsPage,
            ),
            child: BasePage(
              appBar: CustomAppBar(
                isLeading: true,
                icon: Icons.menu,
                onLeadingPressed: _advancedDrawerController.showDrawer,
                centerTitle: true,
                title: Text(
                  context.locale.velocio,
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightMedium,
                  ),
                ),
              ),
              body: MainBody(
                cubit: cubit,
                chats: state.chats!,
              ),
              floatingActionButton: CustomVectorButton(
                buttonColor: context.theme.mainColor,
                buttonShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      AppDimensions.large,
                    ),
                  ),
                ),
                assetPath: AppAssets.addIcon,
                onPressed: cubit.navigateToContactPage,
              ),
            ),
          );
        },
      ),
    );
  }
}
