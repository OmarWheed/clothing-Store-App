import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/core/utils/app_validation.dart';
import 'package:clothing_store/core/widgets/custom_elevated_buttom.dart';
import 'package:clothing_store/core/widgets/custom_text_form_field.dart';
import 'package:clothing_store/feature/auth/domain/entity/sign_up_entity.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key, this.onPressed});
  final Function()? onPressed;

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
            Text("Create Account", style: AppTextStyle.bold32),
            SizedBox(height: 16),
            CustomTextFormField(
              labelText: "Firstname",
              controller: _firstNameContoller,
              validator: Validator.validateName,
            ),
            CustomTextFormField(
              validator: Validator.validateName,
              labelText: "Lastname",
              controller: _lastNameContoller,
            ),
            CustomTextFormField(
              labelText: "Email Address",
              controller: _emailAddressContoller,
              validator: Validator.validateEmail,
            ),
            CustomTextFormField(
              labelText: "Password",
              validator: Validator.validatePassword,
              controller: _passwordController,
            ),
            SizedBox(height: 24),
            CustomElevatedButtom(
              onPressed: () {
                SignUpEntity _entity = SignUpEntity(
                  firstName: _firstNameContoller.text,
                  lastName: _lastNameContoller.text,
                  email: _emailAddressContoller.text,
                  password: _passwordController.text,
                );
    
                if (_formKey.currentState!.validate()) {
                  context.read<AuthViewModel>().signUp(_entity);
                }
    
                //widget.onPressed;
              },
              child: Text("Continue", style: AppTextStyle.medium16),
            ),
            SizedBox(height: 24),
            _buildCreateAccount(),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateAccount() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Forget Password ?", style: AppTextStyle.regular12),
          TextSpan(text: "Reset", style: AppTextStyle.medium12),
        ],
      ),
    );
  }
}
