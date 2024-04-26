import 'package:flutter/material.dart';
import 'package:groceryjam/utils/colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 59,
      decoration: BoxDecoration(
        color: AppPallete.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppPallete.backgroundColor,
            fontSize: 15.05,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
