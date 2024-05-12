import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryjam/features/authentication/view/loginpage.dart';
import 'package:groceryjam/features/mainscreen/homepage.dart';
import 'package:groceryjam/utils/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://kvoujsajqzdnvjgkfqmh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt2b3Vqc2FqcXpkbnZqZ2tmcW1oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQxNTU5OTksImV4cCI6MjAyOTczMTk5OX0.7ZuHfO4hLKaqJjG1m_2WYN6k6UMVyhDnqUqqWuddYmo',
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final supabase = Supabase.instance.client;

  // variable to check if user is logged in
  bool isLoggedIn = false;
  String userType = '';

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final session = await supabase.auth.currentSession;
    if (session != null) {
      // User is logged in, navigate accordingly
      setState(() {
        // variable to check if user is logged in
        isLoggedIn = true;
      });
    } else {
      // User is not logged in, handle as needed
      setState(() {
        // variable to check if user is logged in
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Jam',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: AppPallete.primaryColor),
        useMaterial3: true,
      ),
      home: isLoggedIn ? const HomeScreen() : const LoginPage(),
    );
  }
}
