import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/config/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClothingStoreApp extends StatelessWidget {
  const ClothingStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser?.uid == null
          ? Routes.signInView
          : Routes.homeView,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
