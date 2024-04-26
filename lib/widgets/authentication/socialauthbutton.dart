import 'package:flutter/material.dart';
import 'package:groceryjam/utils/colors.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppPallete.mutedBackgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Image(
          height: 30,
          width: 30,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
