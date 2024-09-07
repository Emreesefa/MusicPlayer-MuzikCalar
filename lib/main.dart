import 'package:flutter/material.dart';

void main() {
  runApp(DreamMusicApp());
}

class DreamMusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedArtist = 'Michael Jackson';
  String nowPlayingTitle = 'Beat It';
  String nowPlayingArtist = 'Michael Jackson';

  List<Map<String, String>> songs = [
    {
      'title': 'Billie Jean',
      'playing': '1,040,811,084',
      'time': '4:54',
      'album': 'Thriller 25 Super Deluxe',
      'image': 'assets/billie_jean.jpg'
    },
    {
      'title': 'Beat It',
      'playing': '643,786,045',
      'time': '4:18',
      'album': 'Thriller 25 Super Deluxe',
      'image': 'assets/beat_it.jpg'
    },
    {
      'title': 'Smooth Criminal',
      'playing': '440,116,165',
      'time': '4:17',
      'album': 'Bad',
      'image': 'assets/smooth_criminal.jpg'
    },
    {
      'title': 'Black or White',
      'playing': '622,732,228',
      'time': '4:16',
      'album': 'Dangerous',
      'image': 'assets/black_or_white.jpg'
    },
    {
      'title': 'Bad',
      'playing': '469,276,429',
      'time': '4:07',
      'album': 'Bad',
      'image': 'assets/bad.jpg'
    },
    {
      'title': 'Remember the Time',
      'playing': '329,284,446',
      'time': '3:58',
      'album': 'Dangerous',
      'image': 'assets/remember_the_time.jpg'
    },
    {
      'title': 'The Way You Make Me Feel',
      'playing': '303,899,401',
      'time': '4:58',
      'album': 'Bad',
      'image': 'assets/the_way_you_make_me_feel.jpg'
    },
    {
      'title': 'Man in the Mirror',
      'playing': '420,582,451',
      'time': '5:19',
      'album': 'Bad',
      'image': 'assets/man_in_the_mirror.jpg'
    },
    {
      'title': 'Dirty Diana',
      'playing': '276,104,835',
      'time': '4:41',
      'album': 'Bad',
      'image': 'assets/dirty_diana.jpg'
    },
    {
      'title': 'Give In to Me',
      'playing': '214,013,123',
      'time': '4:39',
      'album': 'Dangerous',
      'image': 'assets/give_in_to_me.jpg'
    },
  ];

  void changeSong(String title) {
    setState(() {
      nowPlayingTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'), // Your background image path
                  fit: BoxFit.cover, // Ensures the image covers the entire container
                ),
              ),
            ),
          ),
          // Content Over Background
          Row(
            children: [
              // Sidebar Menu
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black87,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Müzik Çalar',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Menu Items
                        MenuItems(),
                        SizedBox(height: 20),
                        Text(
                          'DISCOVER',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        DiscoverItems(),
                        SizedBox(height: 20),
                        Text(
                          'YOUR COLLECTION',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        CollectionItems(),
                        Spacer(),
                        GeneralSettings(),
                      ],
                    ),
                  ),
                ),
              ),
              // Main Content Area
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.black.withOpacity(0.7), // Adjust opacity as needed
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Search Bar and Artist Image
                        HeaderSection(
                          artist: selectedArtist,
                          listeners: '27,852,501',
                        ),
                        SizedBox(height: 20),
                        // Popular Songs List
                        PopularSongsList(
                          songs: songs,
                          onSongTap: changeSong,
                          selectedSong: nowPlayingTitle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Notifications, Friends, and Now Playing Area
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.black87,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NotificationsSection(),
                        SizedBox(height: 20),
                        FriendsSection(),
                        SizedBox(height: 20),
                        NowPlayingSection(
                          title: nowPlayingTitle,
                          artist: nowPlayingArtist,
                          image: 'assets/now_playing.jpg',
                        ),
                      ],
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

// Custom Widgets for the Sidebar Menu, Header, Popular Songs List, Notifications, etc.

class MenuItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(title: 'Home', icon: Icons.home),
        MenuItem(title: 'Trends', icon: Icons.trending_up),
        MenuItem(title: 'Library', icon: Icons.library_music),
        MenuItem(title: 'Discover', icon: Icons.explore),
      ],
    );
  }
}

class DiscoverItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(title: 'Playlists', icon: Icons.playlist_play),
        MenuItem(title: 'Podcasts', icon: Icons.podcasts),
        MenuItem(title: 'Daily Mix', icon: Icons.shuffle),
      ],
    );
  }
}

class CollectionItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(title: 'Liked Songs', icon: Icons.favorite),
        MenuItem(title: 'Favorite Artists', icon: Icons.star),
        MenuItem(title: 'Local', icon: Icons.location_on),
      ],
    );
  }
}

class GeneralSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(title: 'Settings', icon: Icons.settings),
        MenuItem(title: 'Log Out', icon: Icons.logout),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;

  MenuItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.redAccent),
          SizedBox(width: 10),
          Text(title, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final String artist;
  final String listeners;

  HeaderSection({required this.artist, required this.listeners});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artist,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '$listeners monthly listeners',
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/michael_jackson.jpg'), // replace with your image path
        ),
      ],
    );
  }
}

class PopularSongsList extends StatelessWidget {
  final List<Map<String, String>> songs;
  final Function(String) onSongTap;
  final String selectedSong;

  PopularSongsList({
    required this.songs,
    required this.onSongTap,
    required this.selectedSong,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          final isSelected = song['title'] == selectedSong;
          return GestureDetector(
            onTap: () => onSongTap(song['title']!),
            child: SongItem(
              rank: index + 1,
              title: song['title']!,
              playing: song['playing']!,
              time: song['time']!,
              album: song['album']!,
              image: song['image']!,
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}

class SongItem extends StatelessWidget {
  final int rank;
  final String title;
  final String playing;
  final String time;
  final String album;
  final String image;
  final bool isSelected;

  SongItem({
    required this.rank,
    required this.title,
    required this.playing,
    required this.time,
    required this.album,
    required this.image,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? Colors.green : Colors.transparent,
      child: ListTile(
        leading: Image.asset(image, width: 40, height: 40, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(album),
        trailing: Text(time),
      ),
    );
  }
}

class NotificationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('Playlist Added', style: TextStyle(color: Colors.white54)),
        Text('Playlist Shared', style: TextStyle(color: Colors.white54)),
        Text('New Music', style: TextStyle(color: Colors.white54)),
      ],
    );
  }
}

class FriendsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Friends',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        FriendItem(
          name: 'Alice Johnson',
          currentlyPlaying: 'Billie Jean - Michael Jackson',
          image: 'assets/friend1.jpg',
        ),
        FriendItem(
          name: 'Bob Smith',
          currentlyPlaying: 'Beat It - Michael Jackson',
          image: 'assets/friend2.jpg',
        ),
        FriendItem(
          name: 'Charlie Brown',
          currentlyPlaying: 'Smooth Criminal - Michael Jackson',
          image: 'assets/friend3.jpg',
        ),
      ],
    );
  }
}

class FriendItem extends StatelessWidget {
  final String name;
  final String currentlyPlaying;
  final String image;

  FriendItem({
    required this.name,
    required this.currentlyPlaying,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: Colors.white)),
                Text(
                  currentlyPlaying,
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NowPlayingSection extends StatelessWidget {
  final String title;
  final String artist;
  final String image; // Image parameter

  NowPlayingSection({
    required this.title,
    required this.artist,
    required this.image, // Initialize image parameter
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Center align content
      children: [
        Text(
          'Now Playing',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        // Rectangular image
        Container(
          height: 200, // Adjust height as needed
          width: 300, // Adjust width as needed
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image), // Use image parameter
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          artist,
          style: TextStyle(color: Colors.white54),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center align controls
          children: [
            IconButton(
              icon: Icon(Icons.skip_previous),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.skip_next),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}