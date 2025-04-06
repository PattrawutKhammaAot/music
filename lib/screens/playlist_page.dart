import 'package:flutter/material.dart';
import '../models/song.dart';
import '../services/audio_player_service.dart';
import '../widgets/song_tile.dart';
import '../widgets/now_playing_bar.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  final AudioPlayerService _audioPlayerService = AudioPlayerService();
  final List<Song> _songs = Song.getSampleSongs();
  Song? _currentSong;
  bool _isPlaying = false;

  @override
  void dispose() {
    _audioPlayerService.dispose();
    super.dispose();
  }

  void _togglePlayPause(Song song) async {
    setState(() {
      if (_currentSong == null || _currentSong!.id != song.id) {
        _currentSong = song;
        _isPlaying = true;
        _audioPlayerService.playSong(song);
      } else {
        _isPlaying = !_isPlaying;
        if (_isPlaying) {
          _audioPlayerService.resumeSong();
        } else {
          _audioPlayerService.pauseSong();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Music Playlist'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _songs.length,
              itemBuilder: (context, index) {
                final song = _songs[index];
                final isCurrentlyPlaying =
                    _currentSong?.id == song.id && _isPlaying;

                return SongTile(
                  song: song,
                  isPlaying: isCurrentlyPlaying,
                  onTap: () => _togglePlayPause(song),
                );
              },
            ),
          ),
          if (_currentSong != null)
            NowPlayingBar(
              song: _currentSong!,
              isPlaying: _isPlaying,
              onPlayPause: () => _togglePlayPause(_currentSong!),
            ),
        ],
      ),
    );
  }
}
