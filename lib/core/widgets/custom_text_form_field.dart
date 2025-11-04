import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.keyboardType,
    super.key,
    this.labelText,
    this.controller,
    this.obscureText = false,
    this.validator,
  });
  final String? labelText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: AppColor.bgColorTextField,
        filled: true,
        labelStyle: AppTextStyle.regular16.copyWith(
          color: AppColor.textColorTextField,
        ),
      ),
    );
  }
}
