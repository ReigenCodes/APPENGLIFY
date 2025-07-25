import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HalamanDaftar extends StatefulWidget {
  const HalamanDaftar({super.key});

  @override
  State<HalamanDaftar> createState() => _HalamanDaftarState();
}

class _HalamanDaftarState extends State<HalamanDaftar> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar('Email dan password tidak boleh kosong.', isError: true);
      setState(() {
        _isLoading = false;
      });
      return;
    }

    // Simulasi penundaan jaringan
    await Future.delayed(const Duration(seconds: 1));

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // PENTING: Menyimpan password langsung di SharedPreferences TIDAK AMAN untuk aplikasi produksi.
    // Untuk aplikasi nyata, gunakan layanan autentikasi yang aman seperti Firebase Authentication
    // atau backend kustom dengan hashing password yang kuat.
    if (prefs.containsKey(email)) {
      _showSnackBar(
        'Email sudah terdaftar. Silakan gunakan email lain atau masuk.',
        isError: true,
      );
    } else {
      await prefs.setString(
        email,
        password,
      ); // Menyimpan email sebagai kunci dan password sebagai nilai
      _showSnackBar('Pendaftaran berhasil! Silakan masuk.', isError: false);

      // Navigasi kembali ke halaman login (HalamanMasuk)
      Navigator.pop(context);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar untuk penyesuaian responsif
    final screenWidth = MediaQuery.of(context).size.width;
    // Menentukan lebar maksimum untuk input dan tombol
    final maxWidth = screenWidth > 400 ? 350.0 : screenWidth * 0.85;

    return Scaffold(
      backgroundColor: Colors.white, // Latar belakang putih
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ), // Padding horizontal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Judul "DAFTAR"
              const Text(
                'DAFTAR',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 2, // Jarak antar huruf
                ),
              ),
              const SizedBox(height: 50), // Jarak setelah judul
              // Input Email
              SizedBox(
                width: maxWidth,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email, color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ), // Sudut melengkung
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                      ), // Border biru
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                        width: 1.5,
                      ), // Border biru saat tidak fokus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ), // Border biru saat fokus
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20), // Jarak antar input
              // Input Password
              SizedBox(
                width: maxWidth,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true, // Untuk menyembunyikan teks password
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock, color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.blueAccent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 40), // Jarak sebelum tombol
              // Tombol Daftar
              SizedBox(
                width: maxWidth,
                height: 50, // Tinggi tombol
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4FC3F7), // Warna biru muda
                    foregroundColor: Colors.white, // Warna teks putih
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ), // Sudut melengkung
                    ),
                    elevation: 5, // Sedikit bayangan
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Daftar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 30,
              ), // Jarak sebelum teks "Sudah punya akun?"
              // Teks "Sudah punya akun? MASUK"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah punya akun? ',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                      ); // Kembali ke halaman sebelumnya (HalamanMasuk)
                    },
                    child: const Text(
                      'MASUK',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4FC3F7), // Warna biru muda
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
