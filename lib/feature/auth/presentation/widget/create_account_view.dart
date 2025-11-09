import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_extension.dart';
import 'package:clothing_store/core/utils/app_validation.dart';
import 'package:clothing_store/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:clothing_store/feature/auth/presentation/widget/rich_text_widget.dart';
import 'package:flutter/material.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  late TextEditingController _firstNameContoller;
  late TextEditingController _lastNameContoller;
  late TextEditingController _emailAddressContoller;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _firstNameContoller = TextEditingController();
    _lastNameContoller = TextEditingController();
    _emailAddressContoller = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameContoller.dispose();
    _lastNameContoller.dispose();
    _emailAddressContoller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text("Create Account", style: context.appTheme.bold32),
            SizedBox(height: 16),
            _fNameField(),
            _lNameField(),
            _emailField(),
            _passwordField(),
            SizedBox(height: 24),
            _signUpButton(),
            SizedBox(height: 24),
            RichTextWidget(
              fText: 'Forget Password',
              sText: 'Reset',
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.forgetPasswordView);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _fNameField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "Firstname"),
      controller: _firstNameContoller,
      validator: Validator.validateName,
    );
  }

  Widget _lNameField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "Lastname"),
      validator: Validator.validateName,

      controller: _lastNameContoller,
    );
  }

  Widget _signUpButton() {
    return ElevatedButton(
      onPressed: () {
        SignUpEntity entity = SignUpEntity(
          firstName: _firstNameContoller.text,
          lastName: _lastNameContoller.text,
          email: _emailAddressContoller.text,
          password: _passwordController.text,
        );

        if (_formKey.currentState!.validate()) {
          Navigator.of(
            context,
          ).pushNamed(Routes.aboutYouView, arguments: entity);
        }
      },
      child: Text("Continue"),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "Password"),
      validator: Validator.validatePassword,
      controller: _passwordController,
    );
  }

  Widget _emailField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "Email Address"),
      controller: _emailAddressContoller,
      validator: Validator.validateEmail,
    );
  }
}
