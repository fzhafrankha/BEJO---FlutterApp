import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../application/chapter_quiz_notifier.dart';
import '../application/chapters_notifier.dart';

class ChapterQuizScreen extends ConsumerStatefulWidget {
  final int chapterId;
  const ChapterQuizScreen({super.key, required this.chapterId});

  @override
  ConsumerState<ChapterQuizScreen> createState() => _ChapterQuizScreenState();
}

class _ChapterQuizScreenState extends ConsumerState<ChapterQuizScreen> {
  int? _selectedOption;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(chapterQuizNotifierProvider.notifier).start(widget.chapterId));
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chapterQuizNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Quiz Chapter'), backgroundColor: AppColors.background),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(message, textAlign: TextAlign.center),
          ),
        ),
        finished: (rewardGiven) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(rewardGiven ? Icons.emoji_events : Icons.check_circle,
                    size: 72, color: AppColors.buttonGreenBg),
                const SizedBox(height: 16),
                Text(
                  rewardGiven ? 'Selamat! Chapter selesai & EcoPoin diberikan.' : 'Chapter ini sudah pernah kamu selesaikan.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    ref.read(chaptersNotifierProvider.notifier).refresh();
                    context.go('/chapters');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonGreenBg),
                  child: const Text('Kembali ke Edukasi 3R', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
        inProgress: (questions, currentIndex, lastAnswerCorrect) {
          final question = questions[currentIndex];
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Soal ${currentIndex + 1} dari ${questions.length}',
                    style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 12),
                Text(question.questionText, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(height: 20),
                ...List.generate(question.options.length, (i) {
                  final isSelected = _selectedOption == i;
                  final showFeedback = lastAnswerCorrect != null;
                  Color? bg;
                  if (showFeedback && isSelected) {
                    bg = lastAnswerCorrect ? Colors.green.shade100 : Colors.red.shade100;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: OutlinedButton(
                      onPressed: showFeedback
                          ? null
                          : () => setState(() => _selectedOption = i),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: isSelected ? (bg ?? AppColors.inputYellow.withValues(alpha: 0.3)) : null,
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(question.options[i]),
                    ),
                  );
                }),
                const Spacer(),
                if (lastAnswerCorrect == null)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _selectedOption == null
                          ? null
                          : () => ref.read(chapterQuizNotifierProvider.notifier).answer(_selectedOption!),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonGreenBg),
                      child: const Text('Jawab', style: TextStyle(color: Colors.white)),
                    ),
                  )
                else
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => _selectedOption = null);
                        ref.read(chapterQuizNotifierProvider.notifier).next();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonGreenBg),
                      child: Text(
                        currentIndex + 1 >= questions.length ? 'Selesai' : 'Lanjut',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
