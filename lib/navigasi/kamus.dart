import 'package:flutter/material.dart';

class KamusContent extends StatelessWidget {
  const KamusContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Main Scaffold background color
      appBar: AppBar(
        backgroundColor: const Color(0xFF65C4FF), // Light blue color for AppBar
        elevation: 0, // No shadow
        title: const Text(
          'Kamus',
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
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left
          children: [
            const Text(
              'Cari kata bahasa inggris, lengkap dengan\narti, contoh, dan cara pengucapannya.',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Search Bar
            Container(
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
                border: Border.all(
                  color: const Color(0xFF65C4FF),
                  width: 1.5,
                ), // Blue border
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari kata dalam bahasa Inggris',
                  hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none, // Remove default TextField border
                  contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                ),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Kata Favoritmu (Your Favorite Words) Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Kata Favoritmu',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 24,
                    ), // Star icon
                  ],
                ),
                TextButton(
                  onPressed: () {
                    print('Lihat Semua tapped');
                  },
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Color(0xFF65C4FF), // Blue text
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildFavoriteWordsGrid(),
            const SizedBox(height: 24),

            // Kata Populer (Popular Words) Section
            _buildSectionTitle('Kata Populer'),
            const SizedBox(height: 12),
            _buildPopularWordCard('Motivation'),
            const SizedBox(height: 12),
            _buildPopularWordCard('Growth'),
            const SizedBox(height: 12),
            _buildPopularWordCard('Inspiration'),
            const SizedBox(height: 12),
            _buildPopularWordCard('Discipline'),
            const SizedBox(height: 20), // Space at the bottom
          ],
        ),
      ),
    );
  }

  // Helper method to build section titles (reused from BerandaContent/LatihanContent)
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

  // Helper method to build the grid of favorite words
  Widget _buildFavoriteWordsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 3.5, // Adjust aspect ratio for button-like size
      children: [
        _buildFavoriteWordButton('Habit'),
        _buildFavoriteWordButton('Honest'),
        _buildFavoriteWordButton('River'),
        _buildFavoriteWordButton('Necklace'),
      ],
    );
  }

  // Helper method to build individual favorite word buttons
  Widget _buildFavoriteWordButton(String word) {
    return OutlinedButton(
      onPressed: () {
        print('$word button tapped');
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87, // Text color
        side: const BorderSide(
          color: Color(0xFF65C4FF),
          width: 1.5,
        ), // Blue border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(
        word,
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Helper method to build popular word cards
  Widget _buildPopularWordCard(String word) {
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
        border: Border.all(
          color: const Color(0xFF65C4FF),
          width: 1.5,
        ), // Blue border
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            word,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          Icon(
            Icons.volume_up,
            color: const Color(0xFF65C4FF),
            size: 24,
          ), // Speaker icon
        ],
      ),
    );
  }
}
