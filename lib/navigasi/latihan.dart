// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:englify/navigasi/latihan/kosakata.dart'; // Import kosakata.dart

class LatihanContent extends StatelessWidget {
  const LatihanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Main Scaffold background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF65C4FF), // Light blue color for AppBar
        elevation: 0, // No shadow
        title: const Text(
          'Latihan',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true, // Center the title
      ),
      body: SingleChildScrollView(
        // Allow scrolling for the content
        padding: const EdgeInsets.all(16.0), // Overall padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
          children: [
            // Latihan Acak Hari Ini (Random Exercise Today) Section
            _buildSectionTitle('Latihan Acak Hari Ini'),
            const SizedBox(height: 12),
            _buildRandomExerciseCard(),
            const SizedBox(height: 24),

            // Jenis Latihan (Exercise Types) Section
            _buildSectionTitle('Jenis Latihan'),
            const SizedBox(height: 12),
            _buildExerciseTypesGrid(context), // Pass context here
            const SizedBox(height: 24),

            // Progres Latihanmu (Your Exercise Progress) Section
            _buildSectionTitle('Progres Latihanmu'),
            const SizedBox(height: 12),
            _buildExerciseProgressCard(
              completed: 10,
              total: 20,
              progress: 0.5, // 50%
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

  // Helper method to build the "Random Exercise Today" card
  Widget _buildRandomExerciseCard() {
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Latihan Acak Hari Ini',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Coba soal acak dan tingkatkan kemampuanmu!',
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: () {
              print('Mulai Sekarang button tapped');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF65C4FF), // Button background color
              foregroundColor: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              elevation: 2, // Button shadow
            ),
            icon: const Icon(Icons.refresh, size: 20), // Refresh icon
            label: const Text(
              'Mulai Sekarang',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the grid of exercise types
  Widget _buildExerciseTypesGrid(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding inside the container
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255), // Light purple background for the grid area
        borderRadius: BorderRadius.circular(12), // Rounded corners for the container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GridView.count(
        shrinkWrap: true, // Use only the space it needs
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling in grid
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 16, // Spacing between columns
        mainAxisSpacing: 16, // Spacing between rows
        childAspectRatio: 1.2, // Adjust aspect ratio for card size
        children: [
          _buildExerciseTypeCard(
            context: context, // Pass context to _buildExerciseTypeCard
            icon: Icons.psychology,
            title: 'Kosakata',
            subtitle: '(Vocabulary)',
            color: const Color(0xFF65C4FF), // Icon color
          ),
          _buildExerciseTypeCard(
            context: context, // Pass context to _buildExerciseTypeCard
            icon: Icons.abc,
            title: 'Tata Bahasa',
            subtitle: '(Grammar)',
            color: const Color(0xFF65C4FF), // Icon color
          ),
          _buildExerciseTypeCard(
            context: context, // Pass context to _buildExerciseTypeCard
            icon: Icons.edit,
            title: 'Menulis',
            subtitle: '(Writing)',
            color: const Color(0xFF65C4FF), // Icon color
          ),
          _buildExerciseTypeCard(
            context: context, // Pass context to _buildExerciseTypeCard
            icon: Icons.headphones,
            title: 'Mendengarkan',
            subtitle: '(Listening)',
            color: const Color(0xFF65C4FF), // Icon color
          ),
        ],
      ),
    );
  }

  // Helper method to build individual exercise type cards
  Widget _buildExerciseTypeCard({
    required BuildContext context, // Add context as a required parameter
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color, // This 'color' is for the icon, not the card background
  }) {
    return Card(
      color: Colors.white, // Explicitly set card background to white
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: title == 'Kosakata'
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KosakataPage()),
                );
              }
            : null, // Only Kosakata has navigation
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: color,
              ), // Icon uses the passed 'color'
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the "Exercise Progress" card
  Widget _buildExerciseProgressCard({
    required int completed,
    required int total,
    required double progress,
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
          Text(
            '$completed dari $total latihan selesai',
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF65C4FF)),
                minHeight: 25,
                borderRadius: BorderRadius.circular(12),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    '${(progress * 100).toInt()}%', // Display percentage
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
        ],
      ),
    );
  }
}