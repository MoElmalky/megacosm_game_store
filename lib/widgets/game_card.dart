import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';

class GameCard extends StatelessWidget {
  final Game game;
  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.black,
        child: Container(
          //padding: EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 40, 40, 40),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(game.poster),
                fit: BoxFit.fill,
                width: 120,
                height: 150,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Text(
                      game.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    game.price,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    game.developer,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    game.publisher,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
