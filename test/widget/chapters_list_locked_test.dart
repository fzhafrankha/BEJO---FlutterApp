import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tamagotchi_app/features/chapters/application/chapters_notifier.dart';
import 'package:tamagotchi_app/features/chapters/data/chapter_models.dart';
import 'package:tamagotchi_app/features/chapters/presentation/chapters_list_screen.dart';

class _FakeChaptersNotifier extends ChaptersNotifier {
  @override
  Future<List<Chapter>> build() async => const [
        Chapter(
          id: 1,
          title: 'Sampah Organik',
          orderIndex: 1,
          rewardCurrency: 40,
          isUnlocked: true,
          isCompleted: false,
          rewardClaimed: false,
        ),
        Chapter(
          id: 2,
          title: 'Sampah Anorganik',
          orderIndex: 2,
          rewardCurrency: 50,
          isUnlocked: false,
          isCompleted: false,
          rewardClaimed: false,
        ),
      ];
}

void main() {
  testWidgets('chapter terkunci tidak navigasi ke detail, tampilkan pesan', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [chaptersNotifierProvider.overrideWith(_FakeChaptersNotifier.new)],
        child: const MaterialApp(home: ChaptersListScreen()),
      ),
    );
    await tester.pumpAndSettle();

    // Card menghapus prefix "Sampah " dari judul (lihat ChaptersListScreen).
    expect(find.text('Anorganik'), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);

    await tester.tap(find.text('Anorganik'));
    await tester.pump();

    expect(find.textContaining('Selesaikan chapter sebelumnya'), findsOneWidget);
  });
}
