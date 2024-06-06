import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/navigation/app_router.dart';
import 'package:velocio/src/common/navigation/configurations.dart';
import 'package:velocio/src/common/shared_cubits/app_overlay/app_overlay_cubit.dart';
import 'package:velocio/src/common/theme/app_theme.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/theme/theme_provider.dart';
import 'package:velocio/src/common/theme/velocio_theme.dart';
import 'package:velocio/src/common/utils/enum/theme_type.dart';
import 'package:velocio/src/features/app/cubit/app_cubit.dart';
import 'package:velocio/src/localization/flutter_gen/velocio_localization.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _router;

  final AppOverlayCubit _overlayCubit = i.get<AppOverlayCubit>();

  @override
  void initState() {
    super.initState();

    _overlayCubit.applyStyle(
      _calculateSystemOverlay(),
    );

    final initialConfig = authConfig();

    _router = AppRouter.router(
      initialLocation: initialConfig.path,
      initialExtra: initialConfig.args,
    );
  }

  VelocioTheme _velocioTheme(AppState state) {
    return switch (state.themeType) {
      ThemeType.light => lightTheme,
      ThemeType.dark => darkTheme,
    };
  }

  SystemUiOverlayStyle _calculateSystemOverlay([ThemeType? themeType]) {
    final lightStyle = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );

    final darkStyle = SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    );

    if (themeType != null) {
      return switch (themeType) {
        ThemeType.light => lightStyle,
        ThemeType.dark => darkStyle,
      };
    }

    return lightStyle;
  }

  void _overlayListener(
    ThemeType themeType,
    AppOverlayState state,
  ) {
    if (state.shouldReset) {
      _overlayCubit.reset(
        _calculateSystemOverlay(themeType),
      );
    } else if (state.shouldUpdateRoot) {
      _overlayCubit.replaceRoot(
        _calculateSystemOverlay(themeType),
      );
      SystemChrome.setSystemUIOverlayStyle(
        state.style!,
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        state.style!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AppOverlayCubit>(
      child: CubitScope<AppCubit>(
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, appState) {
            final theme = _velocioTheme(appState);
            return ThemeProvider(
              theme: theme,
              themeData: generateThemeData(theme),
              child: BlocConsumer<AppOverlayCubit, AppOverlayState>(
                bloc: _overlayCubit,
                listener: (context, state) => _overlayListener(
                  appState.themeType,
                  state,
                ),
                builder: (context, state) {
                  return MaterialApp.router(
                    routerDelegate: _router.routerDelegate,
                    routeInformationParser: _router.routeInformationParser,
                    routeInformationProvider: _router.routeInformationProvider,
                    backButtonDispatcher: RootBackButtonDispatcher(),
                    localizationsDelegates: const [
                      CountryLocalizations.delegate,
                      ...VelocioLocalization.localizationsDelegates,
                    ],
                    supportedLocales: VelocioLocalization.supportedLocales,
                    locale: const Locale('en'),
                    theme: context.themeData,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
