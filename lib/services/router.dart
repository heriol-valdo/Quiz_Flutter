import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:quiz/screens/home_screen.dart';
import 'package:quiz/screens/splash_screen.dart';
//ok boss
class RouterService {
  static GoRouter getRoutes() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/quiz',
          name: 'quiz',
          builder: (context, state) => HomeScreen(),
        ),
      ],
    );
  }
}
