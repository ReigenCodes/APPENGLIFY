// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import untuk SystemNavigator
import 'dart:io'; // Import untuk exit

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        255,
        255,
        255,
      ), // Background color for the entire page
      appBar: AppBar(
        // AppBar for the Profile page, matching the overall app theme
        backgroundColor: const Color(0xFF65C4FF),
        elevation: 0, // No shadow for the app bar
        title: const Text(
          'Profil',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        centerTitle: true, // Center the title in the app bar
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView to allow scrolling if content overflows
        padding: const EdgeInsets.all(16.0), // Overall padding for the content
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start (left)
          children: [
            // User Profile Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  // Stack for profile picture and edit icon
                  children: [
                    CircleAvatar(
                      radius: 40, // Size of the profile picture
                      backgroundColor: const Color.fromARGB(
                        255,
                        255,
                        255,
                        255,
                      ), // Placeholder background
                      backgroundImage: const AssetImage(
                        'assets/profile.jpeg', // Menggunakan gambar dari assets
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF65C4FF,
                          ), // Edit icon background color
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            width: 2,
                          ), // White border
                        ),
                        child: const Icon(
                          Icons.edit, // Edit icon
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16), // Space between avatar and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Halo, Mark! ', // Greeting text
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        const Text(
                          '👋', // Waving hand emoji
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4), // Small space below greeting
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF65C4FF),
                          width: 1.5,
                        ), // Underline effect
                        borderRadius: BorderRadius.circular(
                          4,
                        ), // Slightly rounded corners
                      ),
                      child: const Text(
                        'Siap belajar hari ini?', // Motivational text
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24), // Space after profile section
            // Latihan Selesai (Exercises Completed) Progress Card
            _buildProgressCard(
              context,
              title: 'Latihan Selesai',
              progress: 0.5, // 50%
              progressText: '50%',
              subtitle: '10 latihan',
              icon: Icons.laptop_chromebook, // Icon for exercises
            ),
            const SizedBox(height: 16), // Space between progress cards
            // Kata Dihafal (Words Memorized) Progress Card
            _buildProgressCard(
              context,
              title: 'Kata Dihafal',
              progress: 0.65, // 65%
              progressText: '65%',
              subtitle: '65 dari 100 kata baru',
              icon: Icons.psychology_alt, // Icon for words memorized
            ),
            const SizedBox(height: 24), // Space after progress cards
            // Achievement/Quick Action Buttons
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, // Distribute space evenly
              children: [
                _buildActionButton(
                  context,
                  icon: Icons.thumb_up,
                  text: 'Belajar 5 hari\nberturut-turut',
                  color: Colors.blueAccent,
                ),
                _buildActionButton(
                  context,
                  icon: Icons.star,
                  text: '18 kata\nfavorit',
                  color: Colors.amber,
                ),
                _buildActionButton(
                  context,
                  icon: Icons.warning,
                  text: '4 Kata yang\nsering salah',
                  color: Colors.redAccent,
                ),
              ],
            ),
            const SizedBox(height: 24), // Space after action buttons
            // Settings/Options List
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(
                  12,
                ), // Rounded corners for the container
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow effect
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingsTile(context, Icons.language, 'Bahasa'),
                  _buildDivider(),
                  _buildSettingsTile(
                    context,
                    Icons.security,
                    'Keamanan & Privasi',
                  ),
                  _buildDivider(),
                  _buildSettingsTile(context, Icons.help_outline, 'Bantuan'),
                  _buildDivider(),
                  _buildSettingsTile(
                    context,
                    Icons.logout,
                    'Keluar',
                    isLogout: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Space at the bottom
          ],
        ),
      ),
    );
  }

  // Helper method to build progress cards
  Widget _buildProgressCard(
    BuildContext context, {
    required String title,
    required double progress,
    required String progressText,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
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
              Icon(icon, color: Colors.black54, size: 24), // Icon for the card
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            // Stack for progress progress bar and text overlay
            children: [
              LinearProgressIndicator(
                value: progress, // Current progress value (0.0 to 1.0)
                backgroundColor:
                    Colors.grey[300], // Background of the progress bar
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF65C4FF),
                ), // Progress color
                minHeight: 20, // Height of the progress bar
                borderRadius: BorderRadius.circular(
                  10,
                ), // Rounded corners for the bar
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    progressText, // Percentage text
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle, // Subtitle below the progress bar
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build action buttons
  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Expanded(
      child: Card(
        elevation: 2, // Slight shadow for the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ), // Rounded corners for the card
        ),
        child: InkWell(
          // InkWell for ripple effect on tap
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // Handle button tap
            print('$text button tapped');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 8.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 30, color: color), // Icon for the button
                const SizedBox(height: 8),
                Text(
                  text, // Button text
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build settings list tiles
  Widget _buildSettingsTile(
    BuildContext context,
    IconData icon,
    String title, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout
            ? Colors.red
            : Colors.black54, // Red for logout, grey for others
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          color: isLogout ? Colors.red : Colors.black87, // Red for logout text
          fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios, // Arrow icon on the right
        size: 18,
        color: Colors.grey,
      ),
      onTap: () {
        // Handle tap for each setting
        print('$title setting tapped');
        if (isLogout) {
          _showExitConfirmationDialog(context); // Tampilkan dialog konfirmasi
        }
        // No action for other settings (Bahasa, Keamanan & Privasi, Bantuan)
      },
    );
  }

  // Helper method to build a thin divider
  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(color: Colors.grey[200], height: 1, thickness: 1),
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi keluar aplikasi
  void _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        // Gunakan dialogContext untuk Navigator.pop
        return AlertDialog(
          title: const Text(
            'Keluar Aplikasi?',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          content: const Text(
            'Apakah Anda yakin ingin menutup aplikasi ini?', // Frasa disesuaikan
            style: TextStyle(fontFamily: 'Montserrat', color: Colors.black54),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Tutup dialog
              },
              child: const Text(
                'Batal',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xFF65C4FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  dialogContext,
                ).pop(); // Tutup dialog terlebih dahulu
                // Keluar dari aplikasi
                if (Platform.isIOS) {
                  // Untuk iOS, SystemNavigator.pop() adalah cara terbaik untuk menutup aplikasi
                  // Ini mengirim aplikasi ke background atau menghentikannya dengan anggun.
                  SystemNavigator.pop();
                } else if (Platform.isAndroid) {
                  // Untuk Android, SystemNavigator.pop() juga bekerja, tetapi exit(0) akan benar-benar
                  // mengakhiri proses Dart VM, yang mungkin Anda inginkan untuk 'keluar secara langsung'.
                  // Pertimbangkan SystemNavigator.pop() untuk perilaku yang lebih 'normal' seperti tombol back.
                  // Jika Anda benar-benar ingin mematikan aplikasi secara paksa, gunakan exit(0).
                  exit(0);
                } else {
                  // Untuk platform desktop (Windows, macOS, Linux) dan web, exit(0) adalah cara yang tepat.
                  // SystemNavigator.pop() tidak memiliki efek di web dan mungkin tidak berfungsi di desktop.
                  exit(0);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna tombol Keluar
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Keluar',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
