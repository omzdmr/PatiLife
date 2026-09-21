import 'package:flutter/material.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
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

  static const pages = [
    HomeScreen(),
    HealthScreen(),
    DiaryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: IndexedStack(index: index, children: pages),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) => setState(() => index = value),
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home_rounded),
              label: l10n.navToday,
            ),
            NavigationDestination(
              icon: const Icon(Icons.favorite_border_rounded),
              selectedIcon: const Icon(Icons.favorite_rounded),
              label: l10n.navHealth,
            ),
            NavigationDestination(
              icon: const Icon(Icons.auto_stories_outlined),
              selectedIcon: const Icon(Icons.auto_stories_rounded),
              label: l10n.navDiary,
            ),
            NavigationDestination(
              icon: const Icon(Icons.pets_outlined),
              selectedIcon: const Icon(Icons.pets_rounded),
              label: l10n.navProfile,
            ),
          ],
        ),
      ),
    );
  }
}
