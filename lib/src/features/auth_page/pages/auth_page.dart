import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/navigation/entities/go_router_extension.dart';
import 'package:velocio/src/common/widgets/base_page/base_page.dart';
import 'package:velocio/src/features/auth_page/cubit/auth_cubit.dart';
import 'package:velocio/src/features/auth_page/widgets/login_body.dart';
import 'package:velocio/src/features/auth_page/widgets/sign_up_body.dart';
import 'package:velocio/src/features/main_page/pages/main_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showSignInPage = true;

  void togglePages() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  Widget showBody(AuthCubit cubit) {
    if (showSignInPage) {
      return LoginBody(
        cubit: cubit,
        showSignUp: togglePages,
      );
    } else {
      return SignUpBody(
        cubit: cubit,
        showLogin: togglePages,
      );
    }
  }

  void _listener(BuildContext context, AuthState state) {
    if (state.route.type != null) {
      context.navigateTo(state.route);
    }
  }

  bool _listenWhen(AuthState prev, AuthState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AuthCubit>(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final authCubit = CubitScope.of<AuthCubit>(context);

          if (authCubit.isAuth) {
            return const MainPage();
          }

          return BasePage(
            body: showBody(authCubit),
          );
        },
      ),
    );
  }
}
