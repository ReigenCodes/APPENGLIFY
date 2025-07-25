import 'package:flutter/material.dart';
import 'package:englify/navigasi/halamanutama.dart'; // Import beranda.dart

class QuestionSuccessPage extends StatelessWidget {
  const QuestionSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive adjustments
    final screenWidth = MediaQuery.of(context).size.width;
    // Determine maximum width for the button
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
              // Image (Success illustration from assets)
              // PASTIKAN FILE 'assets/questionsucces.png' ADA DI PROYEK ANDA
              // DAN TELAH DIDEKLARASIKAN DI FILE pubspec.yaml ANDA SEPERTI INI:
              //
              // flutter:
              //   assets:
              //     - assets/questionsucces.png
              //
              // SETELAH ITU, JALANKAN 'flutter pub get' DI TERMINAL.
              Image.asset(
                'assets/questionsucces.png', // Using the provided asset path
                width: 200,
                height: 200,
                // No errorBuilder needed if asset is guaranteed to exist
              ),
              const SizedBox(height: 40), // Space after image
              // Title "Terima Kasih!"
              const Text(
                'Terima Kasih!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily:
                      'Montserrat', // Assuming Montserrat for a modern look
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10), // Small space after title
              // Subtitle "Kamu telah menyelesaikan semua pertanyaan."
              const Text(
                'Kamu telah menyelesaikan semua pertanyaan.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                height: 5,
              ), // Small space after first subtitle line
              // Second subtitle line "Jawabanmu sangat membantu!"
              const Text(
                'Jawabanmu sangat membantu!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 80), // Space before button
              // "Beranda" button
              SizedBox(
                width: maxWidth, // Make button full width up to maxWidth
                height: 60, // Set a fixed height for the button
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to BerandaPage and remove all previous routes
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HalamanUtama(),
                      ),
                      (Route<dynamic> route) =>
                          false, // Remove all routes from stack
                    );
                    print('Beranda button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF65C4FF,
                    ), // Light blue background
                    foregroundColor: Colors.white, // White text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ), // Rounded corners
                    ),
                    elevation: 0, // No shadow for a flat look
                  ),
                  child: const Text(
                    'Beranda',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
