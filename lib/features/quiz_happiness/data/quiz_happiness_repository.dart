import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import '../../chapters/data/chapter_models.dart';

final quizHappinessRepositoryProvider = Provider<QuizHappinessRepository>((ref) {
  return QuizHappinessRepository(ref.watch(apiClientProvider));
});

class QuizHappinessRepository {
  final ApiClient apiClient;
  QuizHappinessRepository(this.apiClient);

  Future<List<QuizQuestion>> getQuestions({int limit = 5}) async {
    final res = await apiClient.get('/quiz/happiness', queryParameters: {'limit': limit});
    return (res.data as List).map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<HappinessQuizResult> submit({required int questionId, required int selectedOptionIndex}) async {
    final res = await apiClient.post(
      '/quiz/happiness/submit',
      data: {'quiz_question_id': questionId, 'selected_option_index': selectedOptionIndex},
    );
    return HappinessQuizResult.fromJson(res.data as Map<String, dynamic>);
  }
}
