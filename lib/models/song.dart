class Song {
  final String id;
  final String title;
  final String artist;
  final String albumArt;
  final String url;
  final Duration? duration;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.url,
    this.duration,
  });

  static List<Song> getSampleSongs() {
    return [
      Song(
        id: '1',
        title: 'Blinding Lights',
        artist: 'The Weeknd',
        albumArt: 'https://via.placeholder.com/300',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      ),
      Song(
        id: '2',
        title: 'Dance Monkey',
        artist: 'Tones and I',
        albumArt: 'https://via.placeholder.com/300',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
      ),
      Song(
        id: '3',
        title: 'Watermelon Sugar',
        artist: 'Harry Styles',
        albumArt: 'https://via.placeholder.com/300',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
      ),
      Song(
        id: '4',
        title: 'Don\'t Start Now',
        artist: 'Dua Lipa',
        albumArt: 'https://via.placeholder.com/300',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
      ),
      Song(
        id: '5',
        title: 'Circles',
        artist: 'Post Malone',
        albumArt: 'https://via.placeholder.com/300',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
      ),
    ];
  }
}
