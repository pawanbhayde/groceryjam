import 'package:flutter/material.dart';
import 'package:groceryjam/features/authentication/view/loginpage.dart';
import 'package:groceryjam/utils/colors.dart';
import 'package:groceryjam/widgets/authentication/authbutton.dart';
import 'package:groceryjam/widgets/authentication/authtextfield.dart';
import 'package:groceryjam/widgets/authentication/socialauthbutton.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.primaryColor,
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text("Sign Up",
                  style: TextStyle(
                    color: AppPallete.backgroundColor,
                    fontSize: 31.05,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppPallete.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Add this line (1/2)
                  const Text(
                    "Welcome! ",
                    style: TextStyle(
                      color: AppPallete.primaryTextColor,
                      fontSize: 26.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "To keep connected with us please login with your personal info",
                    style: TextStyle(
                      color: AppPallete.mutedTextColor,
                      fontSize: 15.05,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  const AuthTextField(
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 18),
                  const AuthTextField(
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 18),
                  const AuthTextField(
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 18),
                  const AuthButton(
                    text: 'Sign Up',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: AppPallete.mutedTextColor,
                          fontSize: 15.05,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: AppPallete.primaryColor),
                          ))
                    ],
                  ),
                  const SizedBox(height: 20), // Add this line (2/2
                  const Center(
                    child: Text(
                      "Or Sign In with",
                      style: TextStyle(
                        color: AppPallete.mutedTextColor,
                        fontSize: 15.05,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialAuthButton(
                        imagePath: 'assets/images/google.png',
                      ),
                      SizedBox(width: 20),
                      SocialAuthButton(
                        imagePath: 'assets/images/facebook.png',
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
