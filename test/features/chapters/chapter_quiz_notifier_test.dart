import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tamagotchi_app/core/network/api_exception.dart';
import 'package:tamagotchi_app/features/chapters/application/chapter_quiz_notifier.dart';
import 'package:tamagotchi_app/features/chapters/data/chapter_models.dart';
import 'package:tamagotchi_app/features/chapters/data/chapter_repository.dart';

class MockChapterRepository extends Mock implements ChapterRepository {}

void main() {
  late MockChapterRepository repo;
  late ProviderContainer container;

  setUp(() {
    repo = MockChapterRepository();
    container = ProviderContainer(overrides: [chapterRepositoryProvider.overrideWithValue(repo)]);
    addTearDown(container.dispose);
  });

  test('chapter terkunci (CHAPTER_LOCKED) -> state error, tidak crash', () async {
    when(() => repo.getQuiz(any())).thenThrow(ApiException('CHAPTER_LOCKED', 'Chapter ini belum terbuka'));

    final notifier = container.read(chapterQuizNotifierProvider.notifier);
    await notifier.start(2);

    final state = container.read(chapterQuizNotifierProvider);
    state.maybeWhen(
      error: (message) => expect(message, 'Chapter ini belum terbuka'),
      orElse: () => fail('expected error state, got $state'),
    );
  });

  test('daily cap tercapai (DAILY_CAP_REACHED) saat submit jawaban -> state error', () async {
    when(() => repo.getQuiz(any())).thenAnswer(
      (_) async => const [QuizQuestion(id: 1, questionText: 'Apa itu 3R?', options: ['A', 'B'])],
    );
    when(() => repo.submitQuiz(chapterId: any(named: 'chapterId'), questionId: any(named: 'questionId'), selectedOptionIndex: any(named: 'selectedOptionIndex')))
        .thenThrow(ApiException('DAILY_CAP_REACHED', 'Kamu sudah mencapai batas quiz hari ini. Coba lagi besok!'));

    final notifier = container.read(chapterQuizNotifierProvider.notifier);
    await notifier.start(1);
    await notifier.answer(0);

    final state = container.read(chapterQuizNotifierProvider);
    state.maybeWhen(
      error: (message) => expect(message, contains('batas quiz')),
      orElse: () => fail('expected error state, got $state'),
    );
  });

  test('quiz kosong -> state error jelas (bukan crash index-out-of-range)', () async {
    when(() => repo.getQuiz(any())).thenAnswer((_) async => []);

    final notifier = container.read(chapterQuizNotifierProvider.notifier);
    await notifier.start(1);

    final state = container.read(chapterQuizNotifierProvider);
    expect(state, isA<ChapterQuizState>());
    state.maybeWhen(error: (_) {}, orElse: () => fail('expected error state, got $state'));
  });

  test('jawaban benar semua soal -> finished dengan rewardGiven', () async {
    when(() => repo.getQuiz(any())).thenAnswer(
      (_) async => const [QuizQuestion(id: 1, questionText: 'Q1', options: ['A', 'B'])],
    );
    when(() => repo.submitQuiz(chapterId: any(named: 'chapterId'), questionId: any(named: 'questionId'), selectedOptionIndex: any(named: 'selectedOptionIndex')))
        .thenAnswer((_) async => const ChapterQuizResult(isCorrect: true, chapterDone: true, rewardGiven: true));

    final notifier = container.read(chapterQuizNotifierProvider.notifier);
    await notifier.start(1);
    await notifier.answer(0);
    notifier.next();

    final state = container.read(chapterQuizNotifierProvider);
    state.maybeWhen(
      finished: (rewardGiven) => expect(rewardGiven, true),
      orElse: () => fail('expected finished state, got $state'),
    );
  });
}
