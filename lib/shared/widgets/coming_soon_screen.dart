import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

/// Placeholder generik untuk tab yang belum dibangun (Chapters/News/Chatbot/Profile
/// — masing-masing fitur asli dibangun di phase-nya sendiri).
class ComingSoonScreen extends StatelessWidget {
  final String title;
  const ComingSoonScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('$title — segera hadir', style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
