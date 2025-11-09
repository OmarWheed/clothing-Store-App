import 'package:clothing_store/core/widgets/app_bar_widget.dart';
import 'package:clothing_store/feature/auth/presentation/widget/create_account_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: CreateAccountView(),
      ),
    );
  }
}

