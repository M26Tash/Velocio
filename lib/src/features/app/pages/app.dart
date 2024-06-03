import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/di/injector.dart';
import 'package:velocio/src/common/shared_cubits/app_overlay/app_overlay_cubit.dart';
import 'package:velocio/src/common/theme/app_theme.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/common/theme/theme_provider.dart';
import 'package:velocio/src/common/theme/velocio_theme.dart';
import 'package:velocio/src/common/utils/enum/theme_type.dart';
import 'package:velocio/src/features/app/cubit/app_cubit.dart';
import 'package:velocio/src/features/auth_page/pages/auth_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppOverlayCubit _overlayCubit = i.get<AppOverlayCubit>();

  @override
  void initState() {
    super.initState();

    _overlayCubit.applyStyle(
      _calculateSystemOverlay(),
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
                  return MaterialApp(
                    theme: context.themeData,
                    home: const AuthPage(),
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
