import 'package:flutter/material.dart';
import 'package:englify/question/questionsuccess.dart'; // Pastikan path ini benar

class Question5Page extends StatelessWidget {
  const Question5Page({super.key});

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
              // Title "Seberapa sering kamu menggunakan bahasa Inggris dalam kehidupan sehari-hari?"
              const Text(
                'Seberapa sering kamu menggunakan bahasa Inggris dalam kehidupan sehari-hari?',
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
              // List of frequency buttons
              _buildFrequencyButton(context, 'Setiap hari', maxWidth),
              const SizedBox(height: 15),
              _buildFrequencyButton(
                context,
                'Beberapa kali seminggu',
                maxWidth,
              ),
              const SizedBox(height: 15),
              _buildFrequencyButton(context, 'Kadang-kadang', maxWidth),
              const SizedBox(height: 15),
              _buildFrequencyButton(context, 'Sangat jarang', maxWidth),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a frequency button
  Widget _buildFrequencyButton(
    BuildContext context,
    String text,
    double width,
  ) {
    return SizedBox(
      width: width,
      height: 70, // Button height, slightly taller for longer text
      child: OutlinedButton(
        // Changed from ElevatedButton to OutlinedButton
        onPressed: () {
          // Navigate to QuestionSuccessPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const QuestionSuccessPage(), // Mengarah ke QuestionSuccessPage
            ),
          );
          print('Tombol "$text" ditekan!');
        },
        style: OutlinedButton.styleFrom(
          // Changed to OutlinedButton.styleFrom
          backgroundColor: Colors.white, // White background for outlined button
          foregroundColor: Colors.black, // Black text color for outlined button
          side: const BorderSide(
            // Add border for OutlinedButton
            color: Color(0xFF65C4FF), // Light blue border
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15.0,
            ), // Rounded corners, adjusted to 15.0
          ),
          // elevation is not applicable to OutlinedButton, removed
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
