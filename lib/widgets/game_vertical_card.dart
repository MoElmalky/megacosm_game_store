import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/utils/price_display.dart';

class GameVerticalCard extends StatelessWidget {
  final Game game;
  const GameVerticalCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(game.poster,width: 160,height: 200,fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              width: 120,
              child: Text(game.name,style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
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