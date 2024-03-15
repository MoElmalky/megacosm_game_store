import 'package:flutter/material.dart';
import 'package:megacosm_game_store/views/game_page.dart';
import 'package:megacosm_game_store/views/home_page.dart';
import 'package:megacosm_game_store/views/login_page.dart';
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'loginPage':(context) => const HomePage(),
        'homePage': (context) => const HomePage(),
        'gamePage': (context) => const GamePage(),
        
      },
      home: const LoginPage(),
      theme: ThemeData.dark()
    );
  }
}
