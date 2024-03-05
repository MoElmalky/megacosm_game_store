import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';

class GamePage extends StatelessWidget {
  final Game game;
  const GamePage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
    );
  }
}