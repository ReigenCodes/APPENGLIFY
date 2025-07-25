import 'package:flutter/material.dart';
import 'dart:async'; // Required for Timer
import 'package:englify/login/halamanlogin.dart'; // Import HalamanLogin

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'englify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(), // Set SplashScreen as the initial home
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Fade-out duration
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut, // Animation curve for a smooth fade-out
      ),
    );

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

    // Display splash screen for 2 seconds, then start fade-out (1 second). Total 3 seconds.
    Timer(const Duration(seconds: 2), () {
      _animationController.forward(); // Start the fade-out animation
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation, // Apply the fade animation
        child: Container(
          color: const Color(0xFF4FC3F7), // Light blue color
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Centered Englify logo. Make sure 'assets/englify.png' exists.
                Image.asset('assets/englify.png', width: 200, height: 200),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
