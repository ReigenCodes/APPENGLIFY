import 'package:flutter/material.dart';

import 'package:englify/navigasi/beranda.dart'; // Import Beranda
import 'package:englify/navigasi/latihan.dart'; // Import LatihanContent
import 'package:englify/navigasi/kamus.dart'; // Import KamusContent
import 'package:englify/navigasi/profile.dart'; // Import ProfilContent

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _currentIndex = 0; // Current active tab index

  // List of pages/widgets to display based on the selected tab
  // Each child now represents a full page with its own Scaffold and AppBar
  final List<Widget> _children = [
    const Beranda(), // Content for the Home page (corrected from BerandaContent)
    const LatihanContent(), // Content for the Exercise page
    const KamusContent(), // Content for the Dictionary page
    const ProfileContent(), // Content for the Profile page
  ];

  // Function called when a BottomNavigationBar item is tapped
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the active tab index
    });
    print('Bottom nav item tapped: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Main Scaffold background color
      // AppBar is removed from here and will be handled by individual content pages
      body: _children[_currentIndex], // Display the selected page content
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure all items are visible
        backgroundColor: Colors.white,
        selectedItemColor: const Color(
          0xFF65C4FF,
        ), // Light blue for selected item
        unselectedItemColor: Colors.black54, // Grey for unselected item
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Montserrat'),
        currentIndex: _currentIndex, // Set the current active index
        onTap: onTabTapped, // Call the function when an item is tapped
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment,
            ), // Or a more suitable icon for 'Latihan'
            label: 'Latihan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Or a more suitable icon for 'Kamus'
            label: 'Kamus',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
