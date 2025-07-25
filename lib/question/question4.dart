import 'package:flutter/material.dart';
import 'package:englify/question/question5.dart'; // Pastikan path ini benar

class Question4Page extends StatelessWidget {
  const Question4Page({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive adjustments
    final screenWidth = MediaQuery.of(context).size.width;
    // Determine maximum width for buttons
    final maxWidth = screenWidth > 400 ? 350.0 : screenWidth * 0.85;

    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ), // Horizontal padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title "Seberapa percaya diri kamu saat menggunakan bahasa Inggris?"
              const Text(
                'Seberapa percaya diri kamu saat menggunakan bahasa Inggris?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily:
                      'Montserrat', // Assuming Montserrat for a modern look
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40), // Space after title
              // List of confidence level buttons
              _buildConfidenceButton(context, 'Tidak percaya diri', maxWidth),
              const SizedBox(height: 15),
              _buildConfidenceButton(context, 'Biasa saja', maxWidth),
              const SizedBox(height: 15),
              _buildConfidenceButton(context, 'Cukup percaya diri', maxWidth),
              const SizedBox(height: 15),
              _buildConfidenceButton(context, 'Sangat percaya diri', maxWidth),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a confidence button
  Widget _buildConfidenceButton(
    BuildContext context,
    String text,
    double width,
  ) {
    return SizedBox(
      width: width,
      height: 70, // Button height, slightly taller for longer text
      child: OutlinedButton(
        onPressed: () {
          // Navigate to Question5Page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const Question5Page(), // Mengarah ke Question5Page
            ),
          );
          print('Tombol "$text" ditekan!');
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white, // White background for outlined button
          foregroundColor: Colors.black, // Black text color for outlined button
          side: const BorderSide(
            color: Color(0xFF65C4FF), // Light blue border
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15.0,
            ), // Rounded corners, adjusted to 15.0
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ), // Adjusted font weight to normal
        ),
      ),
    );
  }
}
