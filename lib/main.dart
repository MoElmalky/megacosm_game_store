import 'package:flutter/material.dart';
import 'package:megacosm_game_store/views/home_page.dart';
import 'package:megacosm_game_store/views/test.dart';
import 'package:megacosm_game_store/widgets/test_widget.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData.dark()
    );
  }
}
