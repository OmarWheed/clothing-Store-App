import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_extension.dart';
import 'package:clothing_store/core/utils/app_validation.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:clothing_store/feature/auth/presentation/widget/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPasswordView extends StatefulWidget {
  const SignInPasswordView({super.key});
  @override
  State<SignInPasswordView> createState() => _SignInPasswordViewState();
}

class _SignInPasswordViewState extends State<SignInPasswordView> {
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 123),
              Text("Sign in", style: context.appTheme.bold32),
              SizedBox(height: 32),
              TextFormField(
                validator: Validator.validatePassword,
                decoration: InputDecoration(hintText: "Password"),
          
                controller: _passwordController,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthViewModel>().login(
                      email: email,
                      password: _passwordController.text,
                    );
                  }
                },
                child: Text("Continue"),
              ),
              SizedBox(height: 16),
              RichTextWidget(
                fText: "Forget Password ? ",
                sText: "Reset",
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.forgetPasswordView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
