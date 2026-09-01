import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tamagotchi_app/main.dart';

void main() {
  testWidgets('App boots and renders tanpa crash', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: TamagotchiApp()));
    // pumpAndSettle tidak dipakai — SplashScreen punya CircularProgressIndicator
    // (animasi tak terbatas) yang membuatnya tidak akan pernah "settle".
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
