import 'package:flutter/material.dart';
import 'package:englify/navigasi/notifikasi.dart'; // Import NotifikasiPage

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Main Scaffold background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF65C4FF), // Light blue color for AppBar
        elevation: 0, // No shadow
        title: Row(
          children: [
            // Englify logo/text
            const Text(
              'Englify',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_none, // Bell icon
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                // Navigate to NotifikasiPage when the bell icon is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotifikasiPage(),
                  ),
                );
                print('Notification bell tapped from BerandaContent');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Allow scrolling for the content
        padding: const EdgeInsets.all(16.0), // Overall padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
          children: [
            // Kata Hari Ini (Word of the Day) Section
            _buildSectionTitle('Kata Hari Ini'),
            const SizedBox(height: 12),
            _buildWordOfTheDayCard(),
            const SizedBox(height: 24),

            // Progres Kosakata Mingguan (Weekly Vocabulary Progress) Section
            _buildSectionTitle('Progres Kosakata Mingguan'),
            const SizedBox(height: 12),
            _buildWeeklyProgressCard(
              progress: 0.65, // 65%
              progressText: '65%',
              subtitle: '65 dari 100 kata baru',
              remainingTime: '3 hari',
            ),
            const SizedBox(height: 24),

            // Tantangan Hari Ini (Today's Challenge) Section
            _buildSectionTitle('Tantangan Hari Ini'),
            const SizedBox(height: 12),
            _buildChallengeCard(
              title: 'Pelajari 5 kata baru',
              remainingTime: '7 jam',
            ),
            const SizedBox(height: 24),

            // Latihan Terbaru (Latest Exercise) Section
            _buildSectionTitle('Latihan Terbaru'),
            const SizedBox(height: 12),
            _buildExerciseCard(
              title: 'Latihan Vocabulary Level 2',
              subtitle: 'Kata Benda Sehari-hari',
            ),
            const SizedBox(height: 20), // Space at the bottom
          ],
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
      ),
    );
  }

  // Helper method to build the "Word of the Day" card
  Widget _buildWordOfTheDayCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Glimpse',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.volume_up,
                color: Colors.blueAccent,
                size: 24,
              ), // Speaker icon
              const SizedBox(width: 8),
              Icon(
                Icons.star_border,
                color: Colors.grey,
                size: 24,
              ), // Star icon
            ],
          ),
          const SizedBox(height: 12),
          _buildWordDetailRow(Icons.play_arrow, 'Sekilas'), // Play icon
          _buildWordDetailRow(
            Icons.bookmark,
            'Kata benda (noun)',
          ), // Bookmark icon
          _buildWordDetailRow(
            Icons.chat_bubble_outline,
            'I saw a glimpse of her',
          ), // Chat icon
        ],
      ),
    );
  }

  // Helper method to build rows for word details
  Widget _buildWordDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the "Weekly Progress" card
  Widget _buildWeeklyProgressCard({
    required double progress,
    required String progressText,
    required String subtitle,
    required String remainingTime,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF65C4FF),
                ),
                minHeight: 25, // Slightly taller progress bar
                borderRadius: BorderRadius.circular(12),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    progressText,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey[600], size: 18),
                  const SizedBox(width: 5),
                  Text(
                    'Sisa waktu: $remainingTime',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print('Lihat Detail button tapped');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF65C4FF,
                  ), // Button background color
                  foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 2, // Button shadow
                ),
                child: const Text(
                  'Lihat Detail',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build "Challenge" and "Exercise" cards
  Widget _buildChallengeCard({
    required String title,
    required String remainingTime,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey[600], size: 18),
                  const SizedBox(width: 5),
                  Text(
                    'Sisa waktu: $remainingTime',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print('Mulai button tapped for challenge');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF65C4FF),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              elevation: 2,
            ),
            child: const Text(
              'Mulai',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build "Exercise" cards
  Widget _buildExerciseCard({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print('Mulai button tapped for exercise');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF65C4FF),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              elevation: 2,
            ),
            child: const Text(
              'Mulai',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}