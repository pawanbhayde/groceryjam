import 'package:flutter/material.dart';
import 'package:groceryjam/utils/colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key, required this.hintText, required this.obscureText});
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      decoration: BoxDecoration(
        color: AppPallete.mutedBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 16),
          enabledBorder: InputBorder.none,
          focusColor: AppPallete.mutedBackgroundColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppPallete.mutedTextColor,
            fontSize: 15.05,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
