import 'package:flutter/material.dart';
import 'screens/playlist_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Playlist App',
      home: const PlaylistPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
