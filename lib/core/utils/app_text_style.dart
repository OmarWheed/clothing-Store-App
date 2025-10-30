import 'package:flutter/material.dart';

abstract class AppTextStyle {
  // Regular (normal)
  static const Color _white = Colors.white;
  static const TextStyle regular12 = TextStyle(
    fontSize: 12,
    color: _white,

    fontWeight: FontWeight.w400,
  );

  static const TextStyle regular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _white,
  );

  static const TextStyle regular24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: _white,
  );

  static const TextStyle regular32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: _white,
  );

  // Medium
  static const TextStyle medium12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: _white,
  );

  static const TextStyle medium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: _white,
  );

  static const TextStyle medium24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: _white,
  );

  static const TextStyle medium32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: _white,
  );

  // Bold
  static const TextStyle bold12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: _white,
  );

  static const TextStyle bold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: _white,
  );

  static const TextStyle bold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: _white,
  );

  static const TextStyle bold32 = TextStyle(
    fontSize: 32,
    color: _white,
    fontWeight: FontWeight.w700,
  );
}
