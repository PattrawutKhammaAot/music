import 'package:flutter/material.dart';
import '../models/song.dart';

class SongTile extends StatelessWidget {
  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          song.albumArt,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 50,
              height: 50,
              color: Colors.grey,
              child: Icon(Icons.music_note, color: Colors.white),
            );
          },
        ),
      ),
      title: Text(
        song.title,
        style: TextStyle(
          fontWeight: isPlaying ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(song.artist),
      trailing: IconButton(
        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
        onPressed: onTap,
      ),
      onTap: onTap,
    );
  }
}
