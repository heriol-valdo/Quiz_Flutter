import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quiz/services/router.dart';

// ajout du provider des Meme au-dessus de l'application
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: RouterService.getRoutes().routeInformationParser,
      routeInformationProvider:
          RouterService.getRoutes().routeInformationProvider,
      routerDelegate: RouterService.getRoutes().routerDelegate,
      // home: const HomeScreen(),
    );
  }
}
