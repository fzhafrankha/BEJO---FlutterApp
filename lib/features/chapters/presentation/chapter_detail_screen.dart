import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../application/chapters_notifier.dart';
import '../data/chapter_content.dart';
import '../data/chapter_models.dart';
import '../data/chapter_repository.dart';
import 'widgets/mini_markdown_text.dart';

class ChapterDetailScreen extends ConsumerWidget {
  final int chapterId;
  const ChapterDetailScreen({super.key, required this.chapterId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapters = ref.watch(chaptersNotifierProvider).value;
    Chapter? chapter;
    if (chapters != null) {
      for (final c in chapters) {
        if (c.id == chapterId) {
          chapter = c;
          break;
        }
      }
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: FutureBuilder<ChapterContent>(
          future: ref.watch(chapterRepositoryProvider).getLocalContent(chapterId),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError || !snapshot.hasData) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text('${snapshot.error ?? "Materi tidak ditemukan"}'),
                ),
              );
            }
            final content = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
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
                                if (chapter != null)
                                  Text(
                                    'BAGIAN ${chapter.orderIndex}',
                                    style: const TextStyle(color: Color(0xFFE8F0DC), fontSize: 16),
                                  ),
                                Text(
                                  content.title,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => context.pop(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList.separated(
                    itemCount: content.sections.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 20),
                    itemBuilder: (context, i) {
                      final section = content.sections[i];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(section.heading,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          MiniMarkdownText(
                            section.body,
                            style: const TextStyle(fontSize: 15, height: 1.4, color: Colors.black87),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (chapter?.isUnlocked ?? true)
                            ? () => context.push('/chapters/$chapterId/quiz')
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonGreenBg,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          chapter?.isCompleted == true ? 'Ulangi Quiz' : 'Mulai Quiz',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
