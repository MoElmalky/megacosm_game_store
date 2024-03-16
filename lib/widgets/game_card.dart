// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:megacosm_game_store/utils/price_display.dart';
import 'package:megacosm_game_store/utils/score_display.dart';
import 'package:provider/provider.dart';

class GameCard extends StatefulWidget {
  final Game game;
  const GameCard({super.key, required this.game});

  @override
  State<GameCard> createState() => _GameCardState(game);
}

class _GameCardState extends State<GameCard> {
  final Game game;
  _GameCardState(this.game);
  @override
  Widget build(BuildContext context) {
    bool isGameInCart = context.watch<UserProvider>().user!.cart!.any((e) {
      return e.gameId.compareTo(game.gameId) == 0;
    });
    bool isGameInWishlist = context.watch<UserProvider>().user!.wishlist!.any((e) {
      return e.gameId.compareTo(game.gameId) == 0;
    });
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, 'gamePage', arguments: game);
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
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: SizedBox(
                              width: 150,
                              child: Text(
                                game.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 8),
                            child: Row(
                              children: [
                                ...List.generate(
                                    game.genres.length,
                                    (index) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withAlpha(40),
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                            padding: const EdgeInsets.only(left: 18, top: 8),
                            child: Text(
                              game.releaseDate,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5),
                                onTap: () {
                                  setState(() {
                                    isGameInWishlist?
                                    context.read<UserProvider>().removeGameFromWishlist(game):
                                    context.read<UserProvider>().addGameToWishlist(game);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: 1.5, color: Colors.white)),
                                  width: 40,
                                  height: 30,
                                  child: Icon(isGameInWishlist?Icons.check:Icons.add),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(5),
                                onTap: () {
                                  setState(() {
                                    isGameInCart
                                        ? Navigator.pushReplacementNamed(
                                            context, 'cartPage')
                                        : context.read<UserProvider>().addGameToCart(game);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.transparent,
                                      border: Border.all(
                                          width: 1.5, color: Colors.white)),
                                  width: 40,
                                  height: 30,
                                  child: Icon(isGameInCart
                                      ? Icons.shopping_cart_checkout_sharp
                                      : Icons.add_shopping_cart_sharp),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ScoreDisplay(score: game.metascore),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child:
                              PriceDisplay(price: game.price, sale: game.sale),
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
