import 'dart:developer';

import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/core/widgets/custom_elevated_buttom.dart';
import 'package:clothing_store/core/widgets/custom_text_form_field.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPasswordView extends StatefulWidget {
  const SignInPasswordView({super.key, required this.email});
  final String email;
  @override
  State<SignInPasswordView> createState() => _SignInPasswordViewState();
}

class _SignInPasswordViewState extends State<SignInPasswordView> {
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        CustomTextFormField(
          labelText: "Password",
          controller: _passwordController,
        ),
        SizedBox(height: 16),
        CustomElevatedButtom(
          onPressed: () {
            log(widget.email);
            context.read<AuthViewModel>().login(
              email: widget.email,
              password: _passwordController.text,
            );
          },
          /*
      "omarwheed@gmail.com",
      "omar123",
    */
          child: Text("Continue", style: AppTextStyle.medium16),
        ),
        SizedBox(height: 16),
        _buildCreateAccount(),
      ],
    );
  }

  Widget _buildCreateAccount() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Forget Password ? ", style: AppTextStyle.regular12),
          TextSpan(text: "Reset", style: AppTextStyle.medium12),
        ],
      ),
    );
  }
}
