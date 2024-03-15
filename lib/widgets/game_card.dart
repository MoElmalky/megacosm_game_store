import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/utils/price_display.dart';
import 'package:megacosm_game_store/utils/score_display.dart';

class GameCard extends StatelessWidget {
  final Game game;
  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context,'gamePage',arguments: game);
        },
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.white.withAlpha(20),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(40),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(game.poster),
                fit: BoxFit.cover,
                width: 120,
                height: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 10),
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        game.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 8),
                    child: Row(
                      children: [
                        ...List.generate(
                            game.genres.length,
                            (index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(40),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    game.genres[index],
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18,top: 8),
                    child: Text(
                      game.releaseDate,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 8),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        ScoreDisplay(score: game.metascore),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: PriceDisplay(price: game.price, sale: game.sale),
                        ),
                      ],
                    ),
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
