import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/feature/auth/presentation/view/login_view.dart';
import 'package:clothing_store/feature/auth/presentation/view/send_email_view.dart';
import 'package:clothing_store/feature/auth/presentation/view/sign_up_view.dart';
import 'package:clothing_store/feature/auth/presentation/view/tell_us_about_youself.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const String loginView = "LOGIN-VIEW";
  static const String signupView = "SIGN-UP-VIEW";
  static const String sendEmailView = "SEND-EMAIL-VIEW";
  static const String aboutYouView = "ABOUT-YOURSELF-VIEW";
}

Route onGenerateRoute(RouteSettings routes) {
  switch (routes.name) {
    case Routes.loginView:
      return MaterialPageRoute(builder: (context) => LoginView());
    case Routes.signupView:
      return MaterialPageRoute(builder: (context) => SignUpView());
    case Routes.sendEmailView:
      return MaterialPageRoute(builder: (context) => SendEmailView());
    case Routes.aboutYouView:
      return MaterialPageRoute(builder: (context) => AboutYouView());
    default:
      return _unKnownPage();
  }
}

MaterialPageRoute _unKnownPage() {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      body: Center(child: Text("UnKnown Page", style: AppTextStyle.bold24)),
    ),
  );
}
