import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/widgets/game_card.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
      Color mainBlack = const Color.fromRGBO(16, 16, 16, 1);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: mainBlack,
          appBar: AppBar(
            backgroundColor: mainBlack,
          ),
          body: Column(
            children: [
              GameCard(game: games[0]),
            ],
          )),
    );
  }
}
