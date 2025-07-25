import 'package:flutter/material.dart';
import 'package:englify/question/question3.dart'; // Import question3.dart

class Question2Page extends StatelessWidget {
  const Question2Page({super.key});

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
              // Title "Apa tujuan utama kamu dalam belajar bahasa Inggris?"
              const Text(
                'Apa tujuan utama kamu dalam belajar bahasa Inggris?',
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
              // List of objective buttons
              _buildObjectiveButton(
                context,
                'Meningkatkan kemampuan berbicara',
                maxWidth,
              ),
              const SizedBox(height: 15),
              _buildObjectiveButton(
                context,
                'Memahami film atau musik berbahasa Inggris',
                maxWidth,
              ),
              const SizedBox(height: 15),
              _buildObjectiveButton(
                context,
                'Mempersiapkan ujian atau sertifikat (TOEFL, IELTS, dll.)',
                maxWidth,
              ),
              const SizedBox(height: 15),
              _buildObjectiveButton(
                context,
                'Untuk pekerjaan atau karir',
                maxWidth,
              ),
              const SizedBox(height: 15),
              _buildObjectiveButton(context, 'Lainnya', maxWidth),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build an objective button
  Widget _buildObjectiveButton(
    BuildContext context,
    String text,
    double width,
  ) {
    return SizedBox(
      width: width,
      height: 70, // Button height, slightly taller for longer text
      child: OutlinedButton(
        onPressed: () {
          // Navigate to Question3Page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const Question3Page(), // Mengarah ke Question3Page
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
            ), // Rounded corners, adjusted to 15.0 for consistency with other outlined buttons
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
