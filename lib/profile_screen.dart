import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the height of the Status Bar to adjust top content padding.
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black, // Scaffold background color is black by default.
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent, // Transparent app bar.
            elevation: 0, // No shadow for the app bar.
            expandedHeight: 350.0, // Initial height of the top image section.
            floating: false, // Does not float when scrolling up.
            pinned: true, // Keeps the app bar (and thus the image section) visible at the top.
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Background image visible only in this top section.
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/background.png', // Your background image.
                      fit: BoxFit.cover, // Covers the area of this section.
                      alignment: Alignment.topCenter, // Aligns the top of the image.
                    ),
                  ),
                  // Semi-transparent gradient overlay for better readability.
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.4), // More opaque at the top.
                            Colors.black.withOpacity(0.0), // Transparent at the bottom.
                          ],
                          stops: const [0.0, 0.7], // Gradient ends further down.
                        ),
                      ),
                    ),
                  ),
                  // Top profile content (avatar, name, stats).
                  // Dynamic padding added for the status bar.
                  Padding(
                    padding: EdgeInsets.only(top: statusBarHeight + 20.0, bottom: 20.0), // Space for app bar and status bar.
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: const NetworkImage(
                            'https://via.placeholder.com/150/FFFFFF/000000?text=Profile+Image',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Alex Johnson',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '@alexjohnson',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildStatItem(Icons.flag, '24 yo'),
                            const SizedBox(width: 16),
                            _buildStatItem(Icons.sports_soccer, 'DEF'),
                            const SizedBox(width: 16),
                            _buildStatItem(Icons.gamepad, '241 games'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // The 'leading' app bar button.
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen.
              },
            ),
          ),

          // The rest of the profile content (SCROLLABLE).
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20), // Extra space to prevent content from sticking to the top.
                // Message Button.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement message button functionality.
                    },
                    icon: const Icon(Icons.message, color: Colors.black),
                    label: const Text(
                      'Message',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      minimumSize: const Size(double.infinity, 50),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // User Bio/Quote.
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                  child: Text(
                    'Living life one goal at a time. Always ready for a match!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ),
                const SizedBox(height: 20),
                // Kudos Received Card.
                Card(
                  color: Colors.grey[900],
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const SizedBox(width: 8),
                        const Text(
                          '7 kudos received',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // General Information Section.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoTile(Icons.work, 'Event Planner at CeleBreak'),
                      _buildInfoTile(Icons.location_on, 'Lived in Buenos Aires, Frankfurt, Madrid'),
                      _buildInfoTile(Icons.language, 'Speaks English, Spanish, Catalan'),
                      _buildInfoTile(Icons.sports_soccer, 'Supports Boca Juniors, FC Barcelona'),
                      _buildInfoTile(Icons.star, 'Admires Patrick Vieira, Sergio Busquets, Lionel Messi'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Interested In Section.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Interested in',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 12.0,
                        runSpacing: 8.0,
                        children: [
                          _buildInterestChip('Playing piano/keyboard', '🎹'),
                          _buildInterestChip('LEGOs', '🧱'),
                          _buildInterestChip('Journaling', '✍️'),
                          _buildInterestChip('Martial arts', '🥋'),
                          _buildInterestChip('Surfing', '🏄'),
                          _buildInterestChip('Salsa dancing', '💃'),
                          _buildInterestChip('+12', '✨'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'See more',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Football Skills Section.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Football skills',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildSkillProgress('Technical', 4, 5),
                      _buildSkillProgress('Fitness', 5, 5),
                      _buildSkillProgress('Tactical', 3, 5),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Upcoming Pick-up Games Section.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Upcoming pick-up games',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildGameTile(
                        'Today, Tue 17 January, 2023',
                        '10:00',
                        'Barceloneta',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Fields',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Helper widget to build a stat item (e.g., age, position, games).
  Widget _buildStatItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white70),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  // Helper widget to build a general information tile.
  Widget _buildInfoTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.white70),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build an interest chip with an emoji.
  Widget _buildInterestChip(String label, String emoji) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.white)),
        ],
      ),
    );
  }

  // Helper widget to display a skill with a progress bar.
  Widget _buildSkillProgress(String skill, int rating, int maxRating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(skill, style: const TextStyle(fontSize: 16, color: Colors.white)),
              Text(
                '$rating/$maxRating',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: rating / maxRating,
            backgroundColor: Colors.grey[700],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow),
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  // Helper widget to display an upcoming game tile.
  Widget _buildGameTile(String date, String time, String location) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.white70),
                const SizedBox(width: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.location_on, size: 16, color: Colors.white70),
                const SizedBox(width: 4),
                Text(
                  location,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}