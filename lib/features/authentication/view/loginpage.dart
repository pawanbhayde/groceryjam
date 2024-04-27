import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groceryjam/features/authentication/view/signinpage.dart';
import 'package:groceryjam/features/mainscreen/homepage.dart';
import 'package:groceryjam/utils/colors.dart';
import 'package:groceryjam/widgets/authentication/authbutton.dart';
import 'package:groceryjam/widgets/authentication/authtextfield.dart';
import 'package:groceryjam/widgets/authentication/socialauthbutton.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final supabase = Supabase.instance.client;

class _LoginPageState extends State<LoginPage> {
  bool valuefirst = false;
  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  Future<AuthResponse> _googleSignIn() async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = 'my-web.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
    ///
    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId = 'my-ios.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

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
              child: Text("Sign In",
                  style: TextStyle(
                    color: AppPallete.backgroundColor,
                    fontSize: 31.05,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            const SizedBox(height: 31),
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
                    "Welcome Back! ",
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
                  const SizedBox(height: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: valuefirst,
                            onChanged: (value) {
                              setState(() {
                                if (valuefirst == false) {
                                  valuefirst = true;
                                } else {
                                  valuefirst = false;
                                }
                              });
                            },
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(
                              color: AppPallete.mutedTextColor,
                              fontSize: 15.05,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: AppPallete.primaryColor),
                          ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  const AuthButton(
                    text: 'Sign In',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
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
                                    builder: (constext) => const SignUpPage()));
                          },
                          child: const Text(
                            "Sign Up",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _googleSignIn,
                        child: const SocialAuthButton(
                          imagePath: 'assets/images/google.png',
                        ),
                      ),
                      const SizedBox(width: 20),
                      const SocialAuthButton(
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
