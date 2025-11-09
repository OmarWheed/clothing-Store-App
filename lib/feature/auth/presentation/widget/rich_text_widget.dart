import 'package:clothing_store/core/utils/app_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    required this.fText,
    required this.sText,
    this.onPressed,
  });
  final String fText;
  final String sText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: fText, style: context.appTheme.medium12),
          TextSpan(
            text: sText,
            style: context.appTheme.bold16.copyWith(fontSize: 12),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}
