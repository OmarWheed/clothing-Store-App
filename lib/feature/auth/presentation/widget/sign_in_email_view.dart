import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_assets.dart';
import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:clothing_store/core/utils/app_extension.dart';
import 'package:clothing_store/core/utils/app_toast.dart';
import 'package:clothing_store/core/utils/app_validation.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model_state.dart';
import 'package:clothing_store/feature/auth/presentation/widget/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInEmailView extends StatefulWidget {
  const SignInEmailView({super.key});

  @override
  State<SignInEmailView> createState() => _SignInEmailViewState();
}

class _SignInEmailViewState extends State<SignInEmailView> {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthViewModel>();
    return BlocListener<AuthViewModel, AuthViewModelState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading ||
          previous.isSuccess != current.isSuccess ||
          previous.isFailure != current.isFailure,
      listener: (context, state) {
        Toast.showLoading(context: context, isLoading: state.isLoading);
        if (state.isSuccess) {
          Toast.showToast(context: context, msg: "Success");
          Navigator.of(context).pushReplacementNamed(Routes.homeView);
        } else if (state.isFailure) {
          Toast.showToast(context: context, msg: "${state.errorMessage}");
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 123),
                Text("Sign in", style: context.appTheme.bold32),
                SizedBox(height: 32),
                _emailField(),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushNamed(
                        Routes.signInPasswordView,
                        arguments: _emailController.text,
                      );
                    }
                  },
                  child: Text("Continue"),
                ),
                SizedBox(height: 16),
                RichTextWidget(
                  fText: "Don't have an Account ?",
                  sText: "Create One",
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed(Routes.signupView);
                  },
                ),
                SizedBox(height: 71),
                googleButton(cubit),
                SizedBox(height: 12),
                facebookButton(cubit),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget googleButton(AuthViewModel cubit) => _buildSignInOption(
    title: "Continue With Google",
    logo: AppPNG.googlePng,
    onPressed: () {
      cubit.loginWithGoogle();
    },
  );
  Widget facebookButton(AuthViewModel cubit) => _buildSignInOption(
    title: "Continue With Facebook",
    logo: AppPNG.facebookPng,
    onPressed: () {
      cubit.loginWithFacebook();
    },
  );
  Widget _emailField() {
    return TextFormField(
      validator: Validator.validateEmail,
      decoration: InputDecoration(hintText: "Email Address"),
      controller: _emailController,
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
            Text(title, style: context.appTheme.medium16),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
