import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryjam/features/authentication/view/loginpage.dart';
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


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Jam',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: AppPallete.primaryColor),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
