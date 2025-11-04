import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ClothingStoreApp extends StatelessWidget {
  const ClothingStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColor.bgColor),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.signupView,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
