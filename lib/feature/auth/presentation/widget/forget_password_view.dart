import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_extension.dart';
import 'package:clothing_store/core/utils/app_validation.dart';
import 'package:clothing_store/core/widgets/app_bar_widget.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailContoller;
  @override
  void initState() {
    _formKey = GlobalKey();
    _emailContoller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 63),
              Text("Forget Password", style: context.appTheme.bold32),
              SizedBox(height: 16),
              _emailField(),
              SizedBox(height: 24),
              _resetPasswordButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resetPasswordButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<AuthViewModel>().resetPassword(_emailContoller.text);
          Navigator.pushNamed(context, Routes.sendEmailView);
        }
      },
      child: Text("Continue"),
    );
  }

  Widget _emailField() {
    return TextFormField(
      validator: Validator.validateEmail,
      decoration: InputDecoration(hintText: "Email Address"),
      controller: _emailContoller,
    );
  }
}
