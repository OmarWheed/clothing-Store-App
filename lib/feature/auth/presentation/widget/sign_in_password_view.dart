import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/core/widgets/custom_elevated_buttom.dart';
import 'package:clothing_store/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignInPasswordView extends StatelessWidget {
  const SignInPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        CustomTextFormField(labelText: "Password", obscureText: true),
        SizedBox(height: 16),
        CustomElevatedButtom(
          onPressed: () {},
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
