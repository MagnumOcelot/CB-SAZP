import 'package:flutter/material.dart';
import 'dart:async';
import 'profile_screen.dart'; // Import the profile screen to navigate to it

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin { // Mixin for animation controller
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Duration for the animation sequence
      vsync: this, // Binds the animation controller to the widget's lifecycle
    );

    // Define fade-in animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    // Define scale-up animation with an ease-out curve for a natural effect
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the animation immediately
    _controller.forward();

    // Navigate to the profile screen after a delay, allowing the animation to play
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement( // Use pushReplacement to prevent going back to splash
        MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Ensures the stack fills the entire screen
        children: [
          // Background image for the splash screen         
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover, // Cover the entire screen
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: const Column( // Added 'const' as content is static
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Application icon (soccer ball)
                    Icon(
                      Icons.sports_soccer,
                      size: 100,
                      color: Colors.yellow, // Accent color for the icon
                    ),
                    SizedBox(height: 16),
                    // Application motto or title
                    Text(
                      'Celebreak, vivimos el football',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}