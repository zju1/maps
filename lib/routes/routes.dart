import 'package:go_router/go_router.dart';
import 'package:travel/screens/main_group/explore_screen.dart';
import 'package:travel/screens/main_group/home_screen.dart';
import 'package:travel/screens/main_group/main_group.dart';
import 'package:travel/screens/main_group/profile_screen.dart';
import 'package:travel/screens/main_group/saved_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainGroup(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const HomeScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
            );
          },
        ),
        GoRoute(
          path: '/explore',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const ExploreScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
            );
          },
        ),
        GoRoute(
          path: '/saved',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const SavedScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
            );
          },
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const ProfileScreen(),
              key: state.pageKey,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) => child,
            );
          },
        ),
      ],
    ),
  ],
);
