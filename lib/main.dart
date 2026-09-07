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
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7B2CBF),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F5FF),
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

  final pages = const [
    _HomePage(),
    _SearchPage(),
    _NotificationsPage(),
    _ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yaaro',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
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

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF7B2CBF),
                Color(0xFFE83E8C),
              ],
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Yaaro 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Connect, share and discover.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const _PostCard(),
        const _PostCard(),
      ],
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 10),
                Text(
                  'Yaaro User',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFEDE7F6),
              ),
              child: const Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 54,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 18),
                Icon(Icons.chat_bubble_outline),
                SizedBox(width: 18),
                Icon(Icons.send_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchPage extends StatelessWidget {
  const _SearchPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Yaaro Search',
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}

class _NotificationsPage extends StatelessWidget {
  const _NotificationsPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Notifications',
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'My Profile',
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
