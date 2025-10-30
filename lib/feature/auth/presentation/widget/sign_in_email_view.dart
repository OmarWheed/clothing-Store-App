import 'package:clothing_store/core/utils/app_assets.dart';
import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:clothing_store/core/utils/app_text_style.dart'
    show AppTextStyle;
import 'package:clothing_store/core/widgets/custom_elevated_buttom.dart';
import 'package:clothing_store/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignInEmailView extends StatelessWidget {
  const SignInEmailView({super.key, this.onPressed});
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        CustomTextFormField(labelText: "Email Address"),
        SizedBox(height: 16),
        CustomElevatedButtom(
          onPressed: onPressed,
          child: Text("Continue", style: AppTextStyle.medium16),
        ),
        SizedBox(height: 16),
        _buildCreateAccount(),
        SizedBox(height: 71),
        _buildSignInOption(
          title: "Continue With Google",
          logo: AppPNG.googlePng,
          onPressed: () {},
        ),
        SizedBox(height: 12),
        _buildSignInOption(
          title: "Continue With Facebook",
          logo: AppPNG.facebookPng,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSignInOption({
    required String title,
    required String logo,
    required void Function() onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.bgColorTextField,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(logo),
            Spacer(),
            Text(title, style: AppTextStyle.medium16),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateAccount() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Don't have an Account ?",
            style: AppTextStyle.regular12,
          ),
          TextSpan(text: "Create One", style: AppTextStyle.medium12),
        ],
      ),
    );
  }
}
