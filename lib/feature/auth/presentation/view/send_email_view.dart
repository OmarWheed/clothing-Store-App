import 'package:clothing_store/core/config/on_generate_route.dart';
import 'package:clothing_store/core/utils/app_assets.dart';
import 'package:clothing_store/core/utils/app_text_style.dart';
import 'package:clothing_store/core/widgets/custom_elevated_buttom.dart';
import 'package:flutter/material.dart';

class SendEmailView extends StatelessWidget {
  const SendEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Image.asset(AppPNG.sendEmailPng),
            Text(
              "We Sent you an Email to reset Your password.",
              textAlign: TextAlign.center,
              style: AppTextStyle.medium24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 91),
              child: CustomElevatedButtom(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.loginView);
                },
                child: Text("Return to Login", style: AppTextStyle.medium16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
