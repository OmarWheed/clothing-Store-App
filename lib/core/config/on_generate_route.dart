import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/di.dart';
import 'package:clothing_store/feature/auth/presentation/view/login_view.dart';
import 'package:clothing_store/feature/auth/presentation/view/send_email_view.dart';
import 'package:clothing_store/feature/auth/presentation/view/sign_up_view.dart';
import 'package:clothing_store/feature/auth/presentation/view/tell_us_about_youself.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:clothing_store/feature/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Routes {
  static const String loginView = "LOGIN-VIEW";
  static const String signupView = "SIGN-UP-VIEW";
  static const String sendEmailView = "SEND-EMAIL-VIEW";
  static const String aboutYouView = "ABOUT-YOURSELF-VIEW";
  static const String homeView = "HOME-VIEW";
}

Route onGenerateRoute(RouteSettings routes) {
  switch (routes.name) {
    case Routes.loginView:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt.get<AuthViewModel>(),
          child: LoginView(),
        ),
      );
    case Routes.signupView:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt.get<AuthViewModel>(),
          child: SignUpView(),
        ),
      );
    case Routes.sendEmailView:
      return MaterialPageRoute(builder: (context) => SendEmailView());
    case Routes.aboutYouView:
      return MaterialPageRoute(builder: (context) => AboutYouView());
    case Routes.homeView:
      return MaterialPageRoute(builder: (context) => HomeView());
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
