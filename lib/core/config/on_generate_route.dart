import 'package:clothing_store/core/utils/app_extension.dart';
import 'package:clothing_store/core/di/di.dart';
import 'package:clothing_store/feature/auth/presentation/view/sing_in_view.dart';
import 'package:clothing_store/feature/auth/presentation/view/send_email_view.dart';
import 'package:clothing_store/feature/auth/presentation/view/sign_up_view.dart';
import 'package:clothing_store/feature/auth/presentation/view/tell_us_about_youself.dart';
import 'package:clothing_store/feature/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:clothing_store/feature/auth/presentation/widget/create_account_view.dart';
import 'package:clothing_store/feature/auth/presentation/widget/forget_password_view.dart';
import 'package:clothing_store/feature/auth/presentation/widget/sign_in_email_view.dart';
import 'package:clothing_store/feature/auth/presentation/widget/sign_in_password_view.dart';
import 'package:clothing_store/feature/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Routes {
  static const String signInView = "SIGN-IN-VIEW";
  static const String signupView = "SIGN-UP-VIEW";
  static const String sendEmailView = "SEND-EMAIL-VIEW";
  static const String aboutYouView = "ABOUT-YOURSELF-VIEW";
  static const String homeView = "HOME-VIEW";
  static const String signInEmailView = "SIGN-IN-EMAIL-VIEW";
  static const String signInPasswordView = "SIGN-IN-PASSWORD-VIEW";
  static const String forgetPasswordView = "FORGET-PASSWORD-VIEW";
}

Route onGenerateRoute(RouteSettings routes) {
  switch (routes.name) {
    case Routes.signInView:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt.get<AuthViewModel>(),
          child: SignInView(),
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
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt.get<AuthViewModel>(),
          child: AboutYouView(),
        ),
        settings: routes,
      );

    case Routes.signInEmailView:
      return MaterialPageRoute(builder: (context) => SignInEmailView());

    case Routes.forgetPasswordView:
      return MaterialPageRoute(
        builder: (context) => ForgetPasswordView(),
        settings: routes,
      );

    case Routes.signInPasswordView:
      return MaterialPageRoute(
        builder: (context) => SignInPasswordView(),
        settings: routes,
      );
    case Routes.homeView:
      return MaterialPageRoute(builder: (context) => HomeView());
    default:
      return _unKnownPage();
  }
}

MaterialPageRoute _unKnownPage() {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      body: Center(child: Text("UnKnown Page", style: context.appTheme.bold24)),
    ),
  );
}
