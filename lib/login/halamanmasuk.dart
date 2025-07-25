import 'package:flutter/material.dart';
import '/login/halamandaftar.dart'; // Sesuaikan path ini jika perlu
import '/question/question1.dart'; // Sesuaikan path ini jika perlu

class HalamanMasuk extends StatelessWidget {
  const HalamanMasuk({super.key});

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
              // "MASUK" title
              const Text(
                'MASUK',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily:
                      'Montserrat', // Assuming Montserrat for a modern look
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 50,
              ), // Space between title and input fields
              // Email Input Field
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(
                    Icons.mail_outline,
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xFF65C4FF), // Light blue border
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF65C4FF), // Light blue border
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color(
                        0xFF65C4FF,
                      ), // Light blue border when focused
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontFamily: 'Montserrat'),
              ),
              const SizedBox(height: 20), // Space between input fields
              // Password Input Field
              TextField(
                obscureText: true, // Hide password text
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.black54,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xFF65C4FF), // Light blue border
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF65C4FF), // Light blue border
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color(
                        0xFF65C4FF,
                      ), // Light blue border when focused
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                ),
                style: const TextStyle(fontFamily: 'Montserrat'),
              ),
              const SizedBox(
                height: 40,
              ), // Space between input fields and button
              // "Masuk" button
              SizedBox(
                width: double.infinity, // Make button full width
                height: 60, // Set a fixed height for the button
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Question1
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Question1Page(),
                      ),
                    );
                    print('Masuk button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF65C4FF,
                    ), // Solid light blue background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ), // Rounded corners
                    ),
                    elevation: 0, // No shadow for a flat look
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                ),
              ),
              // "Lupa Password?" text
              const SizedBox(
                height: 10,
              ), // Space between button and "Lupa Password?"
              GestureDetector(
                onTap: () {
                  // TODO: Implement Forgot Password functionality
                  print('');
                },
                child: const Text(
                  '',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: Colors.black54, // Slightly lighter color
                    decoration: TextDecoration.underline, // Underline the text
                  ),
                ),
              ),
              const SizedBox(height: 80), // Space above the bottom text
              // "Belum punya akun? DAFTAR" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Belum punya akun? ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to HalamanDaftar
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HalamanDaftar(),
                        ),
                      );
                      print('Daftar text pressed');
                    },
                    child: const Text(
                      'DAFTAR',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF65C4FF), // Light blue color for DAFTAR
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
