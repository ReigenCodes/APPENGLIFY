import 'package:flutter/material.dart';
import 'dart:async'; // Required for Timer
import '/login/halamanlogin.dart'; // Impor HalamanLogin dengan path yang benar

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Controller to manage the animation
  late AnimationController _animationController;
  // Animation for the fade effect (transparency)
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController. Duration of 1 second for the fade-out effect.
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Fade-out duration
    );

    // Initialize fade animation from 1.0 (fully visible) to 0.0 (fully transparent)
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut, // Animation curve for a smooth fade-out
      ),
    );

    // Add a listener to detect when the animation completes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to HalamanLogin after fade-out
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HalamanLogin(),
          ),
        );
      }
    });

    // Start a timer to display the splash screen for 2 seconds,
    // then start the fade-out animation for 1 second. Total 3 seconds.
    Timer(const Duration(seconds: 2), () {
      _animationController.forward(); // Start the fade-out animation
    });
  }

  @override
  void dispose() {
    // Make sure to dispose of the animation controller when the widget is disposed
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity:
            _animation, // Apply the fade animation to the entire splash screen content
        child: Container(
          color: const Color(0xFF4FC3F7), // Light blue color from the image
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Centered Englify logo
                Image.asset('assets/englify.png', width: 200, height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
