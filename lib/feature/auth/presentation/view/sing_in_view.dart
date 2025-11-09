import 'package:clothing_store/feature/auth/presentation/widget/sign_in_email_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: SignInEmailView(),
      ),
    );
  }
}
