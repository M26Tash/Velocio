import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocio/src/common/cubit_scope/cubit_scope.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';
import 'package:velocio/src/features/auth_page/cubit/auth_cubit.dart';
import 'package:velocio/src/features/auth_page/widgets/login_body.dart';
import 'package:velocio/src/features/auth_page/widgets/sign_up_body.dart';

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

  @override
  Widget build(BuildContext context) {
    return CubitScope<AuthCubit>(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final authCubit = CubitScope.of<AuthCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: showBody(authCubit),
          );
        },
      ),
    );
  }
}
