import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/feature/auth/presentation/widget/sign_in_email_view.dart';
import 'package:clothing_store/feature/auth/presentation/widget/sign_in_password_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late PageController _pageController;
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
    );
  }

  List<Widget> get _signInViews => [
    SignInEmailView(
      onPressed: () {
        _pageController.nextPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        );
      },
    ),
    SignInPasswordView(),
  ];
}
