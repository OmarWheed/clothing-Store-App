
import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/core/widgets/custom_elevated_buttom.dart';
import 'package:clothing_store/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Forget Password", style: AppTextStyle.bold32),
        SizedBox(height: 16),
        CustomTextFormField(labelText: "Enter Email address"),
        SizedBox(height: 24),
        CustomElevatedButtom(
          onPressed: (){
            Navigator.pushNamed(context, Routes.sendEmailView);
          },
          child: Text("Continue", style: AppTextStyle.medium16),
        ),
      ],
    );
  }
}

