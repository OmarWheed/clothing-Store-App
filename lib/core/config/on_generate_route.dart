import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/feature/auth/presentation/login/login_view.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const String loginView = "LOGIN-VIEW";
}

Route onGenerateRoute(RouteSettings routes) {
  switch (routes.name) {
    case Routes.loginView:
      return MaterialPageRoute(builder: (context) => LoginView());
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
