import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/network/error_messages.dart';
import '../../../core/theme/app_theme.dart';
import '../application/chapters_notifier.dart';
import '../data/chapter_models.dart';

class ChaptersListScreen extends ConsumerWidget {
  const ChaptersListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chaptersAsync = ref.watch(chaptersNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Edukasi 3R'), backgroundColor: AppColors.background),
      body: RefreshIndicator(
        onRefresh: () => ref.read(chaptersNotifierProvider.notifier).refresh(),
        child: chaptersAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, st) => ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(err is ApiException ? errorMessageFor(err) : 'Gagal memuat chapter'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => ref.read(chaptersNotifierProvider.notifier).refresh(),
                      child: const Text('Coba lagi'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          data: (chapters) => ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: chapters.length,
            separatorBuilder: (_, _) => const SizedBox(height: 16),
            itemBuilder: (context, i) => _ChapterCard(chapter: chapters[i]),
          ),
        ),
      ),
    );
  }
}

class _ChapterCard extends StatelessWidget {
  final Chapter chapter;
  const _ChapterCard({required this.chapter});

  @override
  Widget build(BuildContext context) {
    final locked = !chapter.isUnlocked;
    return Opacity(
      opacity: locked ? 0.5 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: locked
            ? () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Selesaikan chapter sebelumnya dulu untuk membuka ini')),
                )
            : () => context.push('/chapters/${chapter.id}'),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF6FA834),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BAGIAN ${chapter.orderIndex}',
                      style: const TextStyle(color: Color(0xFFE8F0DC), fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      chapter.title.replaceFirst(RegExp('Sampah ', caseSensitive: false), ''),
                      style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '+${chapter.rewardCurrency} EcoPoin',
                      style: const TextStyle(color: Color(0xFFE8F0DC), fontSize: 13),
                    ),
                  ],
                ),
              ),
              Icon(
                locked
                    ? Icons.lock
                    : chapter.isCompleted
                        ? Icons.check_circle
                        : Icons.chevron_right,
                color: Colors.white,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
