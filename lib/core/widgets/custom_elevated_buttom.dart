import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtom extends StatelessWidget {
  const CustomElevatedButtom({
    super.key,
    this.onPressed,
    this.color,
    this.child,
  });

  final Function()? onPressed;
  final Widget? child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColor.primaryColor,
        minimumSize: Size(double.infinity, 52),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
