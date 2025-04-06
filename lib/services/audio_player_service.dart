import 'package:just_audio/just_audio.dart';
import '../models/song.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Song? _currentSong;

  AudioPlayer get audioPlayer => _audioPlayer;
  Song? get currentSong => _currentSong;

  Future<void> playSong(Song song) async {
    _currentSong = song;
    await _audioPlayer.setUrl(song.url);
    await _audioPlayer.play();
  }

  Future<void> pauseSong() async {
    await _audioPlayer.pause();
  }

  Future<void> resumeSong() async {
    await _audioPlayer.play();
  }

  Future<void> stopSong() async {
    await _audioPlayer.stop();
  }

  Future<void> dispose() async {
    await _audioPlayer.dispose();
  }

  bool isPlaying() {
    return _audioPlayer.playing;
  }

  bool isSameSong(Song song) {
    return _currentSong?.id == song.id;
  }
}
