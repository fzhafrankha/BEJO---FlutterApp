import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';

/// Shell bottom-nav 6 tab sesuai navbar Figma (Tamagotchi/3R/Scan Sampah/
/// Berita/Diskusi AI/Profil) — pakai `StatefulShellRoute.indexedStack` supaya
/// state tiap tab persist saat pindah tab (`docs/SCREENS.md` §3).
class AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppShell({super.key, required this.navigationShell});

  static const _labels = ['Tamagotchi', '3R', 'Scan', 'Berita', 'Diskusi AI', 'Profil'];
  static const _icons = [
    Icons.pets,
    Icons.menu_book,
    Icons.camera_alt,
    Icons.article,
    Icons.chat_bubble,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        selectedItemColor: AppColors.buttonGreenBg,
        unselectedItemColor: Colors.black54,
        backgroundColor: const Color(0xFFE8F0DC),
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        items: List.generate(
          _labels.length,
          (i) => BottomNavigationBarItem(icon: Icon(_icons[i]), label: _labels[i]),
        ),
      ),
    );
  }
}
