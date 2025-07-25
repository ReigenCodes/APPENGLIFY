import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      appBar: AppBar(
        backgroundColor: const Color(0xFF65C4FF), // Light blue app bar
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNotificationCard(
              title: 'Kata Hari Ini 📖',
              content:
                  'Kata hari ini: Glimpse. Artinya \'sekilas\'.\n✨ Yuk coba pakai dalama kalimat!',
              onTap: () {
                print('Kata Hari Ini tapped');
              },
            ),
            const SizedBox(height: 15),
            _buildNotificationCard(
              title: 'Tantangan Hari Ini 🎯',
              content:
                  'Pelajari 5 kata baru sebelum jam 8 malam ⏰. Bisa kamu selesaikan?',
              onTap: () {
                print('Tantangan Hari Ini tapped');
              },
            ),
            const SizedBox(height: 15),
            _buildNotificationCard(
              title: 'Progres Belajarmu 📊',
              content:
                  'Kamu sudah belajar 65 dari 100 kata baru. Hanya tinggal 35 lagi untuk menyelesaikan targetmu! ✅',
              onTap: () {
                print('Progres Belajarmu tapped');
              },
            ),
            const SizedBox(height: 15),
            _buildNotificationCard(
              title: 'Progres Latihanmu 🧠',
              content:
                  'Kamu telah menyelesaikan 10 dari 20 latihan. Setengah jalan lagi menuju target! ➡️',
              onTap: () {
                print('Progres Latihanmu tapped');
              },
            ),
            const SizedBox(height: 15),
            _buildNotificationCard(
              title: 'Skor Latihan Terakhir ⭐',
              content:
                  'Keren! Skor kamu di latihan terakhir: 80%. Coba capai 100% di latihan berikutnya! 🔄',
              onTap: () {
                print('Skor Latihan Terakhir tapped');
              },
            ),
            const SizedBox(height: 15),
            _buildNotificationCard(
              title: 'Motivasi Hari Ini ☀️',
              content:
                  'Belajar sebentar lebih baik daripada tidak sama sekali. Yuk buka aplikasimu!',
              onTap: () {
                print('Motivasi Hari Ini tapped');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String content,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white, // Explicitly set background to white
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
          color: Color(0xFF65C4FF), // Light blue border
          width: 2,
        ),
      ),
      child: InkWell(
        // Use InkWell for tap effect
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
