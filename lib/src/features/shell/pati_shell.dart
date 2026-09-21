import 'package:flutter/material.dart';
import '../diary/diary_screen.dart';
import '../health/health_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class PatiShell extends StatefulWidget {
  const PatiShell({super.key});
  @override
  State<PatiShell> createState() => _PatiShellState();
}

class _PatiShellState extends State<PatiShell> {
  int index = 0;
  static const pages = [HomeScreen(), HealthScreen(), DiaryScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          bottom: false,
          child: IndexedStack(index: index, children: pages),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) => setState(() => index = value),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Bugün'),
            NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: 'Sağlık'),
            NavigationDestination(icon: Icon(Icons.auto_stories_outlined), selectedIcon: Icon(Icons.auto_stories), label: 'Günlük'),
            NavigationDestination(icon: Icon(Icons.pets_outlined), selectedIcon: Icon(Icons.pets), label: 'Profil'),
          ],
        ),
      );
}
