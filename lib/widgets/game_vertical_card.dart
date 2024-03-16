// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/data/games_data.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/utils/price_display.dart';

class GameVerticalCard extends StatefulWidget {
  final Game game;
  const GameVerticalCard({super.key, required this.game});

  @override
  // ignore: no_logic_in_create_state
  State<GameVerticalCard> createState() => _GameVerticalCardState(game);
}

class _GameVerticalCardState extends State<GameVerticalCard> {
  final Game game;

  _GameVerticalCardState(this.game);
  @override
  Widget build(BuildContext context) {
    bool isGameInWishlist = gamesInWishlist.any((e) {
      return e.gameId.compareTo(game.gameId) == 0;
    });
    return Container(
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                game.poster,
                width: 160,
                height: 200,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isGameInWishlist
                            ? gamesInWishlist.remove(game)
                            : gamesInWishlist.add(game);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black87),
                      child: Icon(
                        isGameInWishlist?
                        Icons.check_circle_outline_sharp:
                        Icons.add_circle_outline_sharp,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              width: 120,
              child: Text(
                game.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          PriceDisplay(price: game.price, sale: game.sale)
        ],
      ),
    );
  }
}
