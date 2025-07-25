import 'package:flutter/material.dart';
import '/login/halamandaftar.dart'; // Sesuaikan path ini jika perlu
import '/login/halamanmasuk.dart'; // Import halamanmasuk.dart

class HalamanLogin extends StatelessWidget {
  const HalamanLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
          ), // Adjust padding as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // "Selamat Datang di Englify!" text
              const Text(
                'Selamat Datang',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily:
                      'Montserrat', // Assuming Montserrat for a modern look
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                'di Englify!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat', // Assuming Montserrat
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20), // Space between title and subtitle
              // "Pilih cara untuk melanjutkan" text
              const Text(
                'Pilih cara untuk melanjutkan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat', // Assuming Montserrat
                  fontSize: 16,
                  color: Colors.black54, // Slightly lighter color for subtitle
                ),
              ),
              const SizedBox(height: 40), // Space between subtitle and buttons
              // "Masuk" button
              SizedBox(
                width: double.infinity, // Make button full width
                height: 60, // Set a fixed height for the button
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to HalamanMasuk
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const HalamanMasuk(), // Mengarah ke HalamanMasuk
                      ),
                    );
                    print('Masuk button pressed');
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ), // Rounded corners
                    ),
                    side: const BorderSide(
                      color: Color(0xFF65C4FF), // Changed to #65C4FF
                      width: 2,
                    ),
                    backgroundColor:
                        Colors.white, // White background for the button
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black text
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between buttons
              // "Daftar" button
              SizedBox(
                width: double.infinity, // Make button full width
                height: 60, // Set a fixed height for the button
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to HalamanDaftar
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HalamanDaftar(),
                      ),
                    );
                    print('Daftar button pressed');
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ), // Rounded corners
                    ),
                    side: const BorderSide(
                      color: Color(0xFF65C4FF), // Changed to #65C4FF
                      width: 2,
                    ),
                    backgroundColor:
                        Colors.white, // White background for the button
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black text
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
