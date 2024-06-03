import 'package:flutter/material.dart';
import 'package:velocio/src/common/theme/theme_extension.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: const [
            Text('TESTING'),
          ],
        ),
      ),
    );
  }
}
