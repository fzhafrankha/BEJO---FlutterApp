import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/application/auth_notifier.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/otp_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/chapters/presentation/chapter_detail_screen.dart';
import '../../features/chapters/presentation/chapter_quiz_screen.dart';
import '../../features/chapters/presentation/chapters_list_screen.dart';
import '../../features/chatbot/presentation/chatbot_screen.dart';
import '../../features/news/presentation/news_screen.dart';
import '../../features/profile/presentation/edit_profile_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/terms_screen.dart';
import '../../features/quiz_happiness/presentation/quiz_happiness_screen.dart';
import '../../features/shop/presentation/shop_screen.dart';
import '../../features/tamagotchi/presentation/home_screen.dart';
import '../../features/waste_scan/presentation/waste_scan_result_screen.dart';
import '../../features/waste_scan/presentation/waste_scan_screen.dart';
import 'app_shell.dart';

/// Route path konstan lintas fitur — dipakai `context.go(...)` / redirect guard.
abstract class AppRoutes {
  static const splash = '/';
  static const login = '/auth/login';
  static const register = '/auth/register';
  static const otp = '/auth/otp';
  static const home = '/home';
  static const wasteScan = '/waste-scan';
  static const wasteScanResult = '/waste-scan/result';
  static const chapters = '/chapters';
  static const quizHappiness = '/quiz/happiness';
  static const shop = '/shop';
  static const news = '/news';
  static const chatbot = '/chatbot';
  static const profile = '/profile';
  static const profileEdit = '/profile/edit';
  static const profileTerms = '/profile/terms';
}

/// Menjembatani perubahan [AuthState] (Riverpod) ke `Listenable` yang dipahami
/// go_router (`refreshListenable`) — supaya redirect di-re-evaluate otomatis
/// tanpa perlu recreate seluruh `GoRouter` (yang akan reset navigation stack).
class _AuthRefreshListenable extends ChangeNotifier {
  _AuthRefreshListenable(Ref ref) {
    ref.listen(authNotifierProvider, (_, _) => notifyListeners());
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final refreshListenable = _AuthRefreshListenable(ref);
  ref.onDispose(refreshListenable.dispose);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);
      final loc = state.matchedLocation;
      // `/auth/otp` sengaja TIDAK termasuk di sini — hanya valid selama state
      // otpPending (lihat cabang `otpPending` di bawah). Kalau state sudah
      // pindah ke unauthenticated/authenticated tapi user masih di lokasi
      // `/auth/otp` (mis. setelah verifyOtp sukses), harus tetap diredirect.
      final isLoginOrRegisterRoute = loc == AppRoutes.login || loc == AppRoutes.register;
      final isAuthOnlyRoute = isLoginOrRegisterRoute || loc == AppRoutes.splash;

      return authState.when(
        unknown: () => loc == AppRoutes.splash ? null : AppRoutes.splash,
        unauthenticated: (_) => isLoginOrRegisterRoute ? null : AppRoutes.login,
        otpPending: (_) => loc == AppRoutes.otp ? null : AppRoutes.otp,
        authenticated: (_) => isAuthOnlyRoute || loc == AppRoutes.otp ? AppRoutes.home : null,
      );
    },
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: AppRoutes.login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: AppRoutes.register, builder: (context, state) => const RegisterScreen()),
      GoRoute(path: AppRoutes.otp, builder: (context, state) => const OtpScreen()),
      // Route full-screen di atas shell (bukan bagian bottom-nav tab).
      GoRoute(path: AppRoutes.shop, builder: (context, state) => const ShopScreen()),
      GoRoute(
        path: AppRoutes.quizHappiness,
        builder: (context, state) => const QuizHappinessScreen(),
      ),
      GoRoute(
        path: AppRoutes.wasteScanResult,
        builder: (context, state) => const WasteScanResultScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: AppRoutes.home, builder: (context, state) => const HomeScreen())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.chapters,
                builder: (context, state) => const ChaptersListScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (context, state) =>
                        ChapterDetailScreen(chapterId: int.parse(state.pathParameters['id']!)),
                    routes: [
                      GoRoute(
                        path: 'quiz',
                        builder: (context, state) =>
                            ChapterQuizScreen(chapterId: int.parse(state.pathParameters['id']!)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: AppRoutes.wasteScan, builder: (context, state) => const WasteScanScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: AppRoutes.news, builder: (context, state) => const NewsScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.chatbot,
                builder: (context, state) => const ChatbotScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(path: 'edit', builder: (context, state) => const EditProfileScreen()),
                  GoRoute(path: 'terms', builder: (context, state) => const TermsScreen()),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
