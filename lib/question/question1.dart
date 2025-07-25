import 'package:flutter/material.dart';
import 'package:englify/question/question2.dart'; // Import question2.dart

class Question1Page extends StatelessWidget {
  const Question1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: SingleChildScrollView(
        // Added SingleChildScrollView for vertical scrolling
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ), // Adjust padding as needed
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align content to the start
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: <Widget>[
            // Title text
            const Text(
              'Bahasa apa yang ingin kamu gunakan untuk Englify?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily:
                    'Montserrat', // Assuming Montserrat for a modern look
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40), // Space after title
            // List of language buttons
            _buildLanguageButton(context, 'Indonesian (Bahasa Indonesia)'),
            const SizedBox(height: 15),
            _buildLanguageButton(context, 'English (Inggris)'),
            const SizedBox(height: 15),
            _buildLanguageButton(context, '中文 (Mandarin)'),
            const SizedBox(height: 15),
            _buildLanguageButton(context, 'Deutsch (Jerman)'),
            const SizedBox(height: 15),
            _buildLanguageButton(context, '한국어 (Korea)'),
            const SizedBox(height: 15),
            _buildLanguageButton(context, '日本語 (Jepang)'),
            const SizedBox(height: 15),
            _buildLanguageButton(context, 'Tiếng Việt (Vietnam)'),
            const SizedBox(height: 15),
            _buildLanguageButton(context, 'Español (Spanyol)'),
            const SizedBox(height: 15),
            _buildLanguageButton(context, 'Français (Prancis)'),
            const SizedBox(height: 15),
            _buildLanguageButton(context, 'Русский (Rusia)'),
            const SizedBox(height: 15),
            // Add more buttons if needed to match the full scrollable content
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(BuildContext context, String text) {
    return SizedBox(
      width: double.infinity, // Make button full width
      height: 60, // Set a fixed height for the button
      child: OutlinedButton(
        onPressed: () {
          // Navigate to Question2Page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Question2Page()),
          );
          print('Language selected: $text');
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Rounded corners
          ),
          side: const BorderSide(
            color: Color(0xFF65C4FF), // Light blue border
            width: 2,
          ),
          backgroundColor: Colors.white, // White background for the button
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.normal, // Normal weight for button text
            color: Colors.black, // Black text
          ),
        ),
      ),
    );
  }
}
