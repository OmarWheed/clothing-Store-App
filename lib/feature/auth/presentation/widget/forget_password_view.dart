import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/core/widgets/custom_elevated_buttom.dart';
import 'package:clothing_store/core/widgets/custom_text_form_field.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Forget Password", style: AppTextStyle.bold32),
          SizedBox(height: 16),
          CustomTextFormField(labelText: "Enter Email address"),
          SizedBox(height: 24),
          CustomElevatedButtom(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthViewModel>().resetPassword();
                Navigator.pushNamed(context, Routes.sendEmailView);
              }
            },
            child: Text("Continue", style: AppTextStyle.medium16),
          ),
        ],
      ),
    );
  }
}
