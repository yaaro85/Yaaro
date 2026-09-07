import 'package:flutter/material.dart';

void main() {
  runApp(const YaaroApp());
}

class YaaroApp extends StatelessWidget {
  const YaaroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yaaro',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF12091F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8E2DE2),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const YaaroHome(),
    );
  }
}

class YaaroHome extends StatefulWidget {
  const YaaroHome({super.key});

  @override
  State<YaaroHome> createState() => _YaaroHomeState();
}

class _YaaroHomeState extends State<YaaroHome> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    CreatePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xFF1B0D2B),
        indicatorColor: const Color(0xFF8E2DE2),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box_outlined),
            selectedIcon: Icon(Icons.add_box),
            label: 'Create',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_none),
            selectedIcon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: const Color(0xFF12091F),
            title: const Text(
              'Yaaro',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chat_bubble_outline),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 105,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: const [
                  StoryItem(name: 'Your Story', isAdd: true),
                  StoryItem(name: 'Yaaro'),
                  StoryItem(name: 'Friends'),
                  StoryItem(name: 'Explore'),
                  StoryItem(name: 'Creator'),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: PostCard(
              username: 'Yaaro',
              caption: 'Welcome to Yaaro! 👋',
            ),
          ),

          SliverToBoxAdapter(
            child: PostCard(
              username: 'Yaaro Community',
              caption: 'Connect • Share • Discover 💜',
            ),
          ),
        ],
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  final String name;
  final bool isAdd;

  const StoryItem({
    super.key,
    required this.name,
    this.isAdd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF8E2DE2),
                  Color(0xFFFF2D95),
                ],
              ),
            ),
            child: Center(
              child: Icon(
                isAdd ? Icons.add : Icons.person,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final String username;
  final String caption;

  const PostCard({
    super.key,
    required this.username,
    required this.caption,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      color: const Color(0xFF211132),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFF8E2DE2),
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF8E2DE2),
                    Color(0xFFFF2D95),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 70,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                  icon: Icon(
                    liked
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: liked ? Colors.pink : null,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined),
                ),
              ],
            ),

            Text(
              widget.caption,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Search',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Yaaro...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Create Post',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Notifications',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
