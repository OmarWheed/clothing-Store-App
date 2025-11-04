import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/core/utils/app_toast.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model_state.dart';
import 'package:clothing_store/feature/auth/presentation/widget/sign_in_email_view.dart';
import 'package:clothing_store/feature/auth/presentation/widget/sign_in_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

//:TODO "Remove Controller and use onPageChange Or best Performance "
class _LoginViewState extends State<LoginView> {
  late PageController _pageController;
  String emailAddress = "";

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: BlocListener<AuthViewModel, AuthViewModelState>(
          listener: (context, state) {
            // Show or hide the global loading overlay based on the state's isLoading flag
            Toast.showLoading(context: context, isLoading: state.isLoading);

            // Handle terminal states with toasts
            if (state.isSuccess) {
              Toast.showToast(context: context, msg: "Success",);
            } else if (state.isFailure) {
              Toast.showToast(context: context, msg: "${state.errorMessage}");
            }
          },

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 123),
              Text("Sign in", style: AppTextStyle.bold32),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: _signInViews.length,
                  itemBuilder: (context, index) => _signInViews[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get _signInViews => [
    SignInEmailView(
      emailField: (email) {
        emailAddress = email;
      },
      onPressed: () {
        _pageController.nextPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        );
      },
    ),
    SignInPasswordView(email: emailAddress),
  ];
}
