import 'package:flutter/material.dart';
import 'package:myapp/profile_screen.dart'; // Import the main profile screen
import 'package:myapp/splash_screen.dart'; // Import the splash screen

void main() {
  runApp(const MyApp()); // Entry point of the Flutter application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celebreak App', // More specific title for the application
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Opt-in to Material 3 design system
      ),
      home: const SplashScreen(), // The first screen shown when the app starts
      routes: {
        // Define named routes for easier navigation, though not strictly necessary for simple cases
        '/profile': (context) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false, // Remove the debug banner in release mode
    );
  }
}